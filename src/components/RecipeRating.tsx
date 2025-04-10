import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '@/lib/supabase';
import AuthModal from './AuthModal';

interface RecipeRatingProps {
  recipeId: string;
  initialRating?: number;
  totalRatings?: number;
}

export default function RecipeRating({ recipeId, initialRating = 0, totalRatings = 0 }: RecipeRatingProps) {
  const [rating, setRating] = useState(0);
  const [hover, setHover] = useState(0);
  const [userRating, setUserRating] = useState(0);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [message, setMessage] = useState('');
  const [averageRating, setAverageRating] = useState(initialRating);
  const [ratingCount, setRatingCount] = useState(totalRatings);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [showAuthModal, setShowAuthModal] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // Check authentication status
    const checkAuth = async () => {
      const { data: { session } } = await supabase.auth.getSession();
      setIsAuthenticated(!!session);
      
      if (session?.user?.email) {
        // Get user's existing rating if any
        const { data: userRatingData } = await supabase
          .from('recipe_ratings')
          .select('rating')
          .eq('recipe_id', recipeId)
          .eq('user_email', session.user.email)
          .single();

        if (userRatingData) {
          setUserRating(userRatingData.rating);
          setRating(userRatingData.rating);
        }
      }
      setIsLoading(false);
    };

    checkAuth();
  }, [recipeId]);

  const submitRating = async (newRating: number) => {
    if (!isAuthenticated) {
      setShowAuthModal(true);
      return;
    }

    setIsSubmitting(true);
    setMessage('');

    try {
      const { data: { session } } = await supabase.auth.getSession();
      if (!session?.user?.email) {
        throw new Error('Not authenticated');
      }

      const { error } = await supabase
        .from('recipe_ratings')
        .upsert({
          recipe_id: recipeId,
          rating: newRating,
          user_email: session.user.email
        });

      if (error) throw error;

      // Update the displayed rating
      const { data: newRatings } = await supabase
        .from('recipe_ratings')
        .select('rating')
        .eq('recipe_id', recipeId);

      if (newRatings) {
        const avg = newRatings.reduce((acc, curr) => acc + curr.rating, 0) / newRatings.length;
        setAverageRating(avg);
        setRatingCount(newRatings.length);
      }

      setUserRating(newRating);
      setMessage('Rating submitted successfully!');
    } catch (error) {
      console.error('Error submitting rating:', error);
      setMessage('Error submitting rating. Please try again.');
    } finally {
      setIsSubmitting(false);
    }
  };

  if (isLoading) {
    return <div className="flex items-center gap-2 animate-pulse">
      <div className="flex">
        {[1, 2, 3, 4, 5].map((star) => (
          <span key={star} className="text-2xl text-gray-300">★</span>
        ))}
      </div>
      <span className="text-sm text-gray-400">Loading...</span>
    </div>;
  }

  return (
    <>
      <div className="flex flex-col items-center gap-2">
        <div className="flex items-center gap-2">
          <div className="flex">
            {[1, 2, 3, 4, 5].map((star) => (
              <motion.button
                key={star}
                className={`text-2xl ${
                  (hover || rating) >= star
                    ? 'text-yellow-400'
                    : 'text-gray-300 dark:text-gray-600'
                }`}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.9 }}
                onHoverStart={() => setHover(star)}
                onHoverEnd={() => setHover(0)}
                onClick={() => {
                  setRating(star);
                  submitRating(star);
                }}
                disabled={isSubmitting}
              >
                ★
              </motion.button>
            ))}
          </div>
          <span className="text-sm text-gray-600 dark:text-gray-400">
            {averageRating.toFixed(1)} ({ratingCount} {ratingCount === 1 ? 'rating' : 'ratings'})
          </span>
        </div>

        <AnimatePresence>
          {message && (
            <motion.div
              initial={{ opacity: 0, y: -10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              className={`text-sm ${
                message.includes('Error')
                  ? 'text-red-500 dark:text-red-400'
                  : 'text-green-500 dark:text-green-400'
              }`}
            >
              {message}
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      <AuthModal 
        isOpen={showAuthModal} 
        onClose={() => setShowAuthModal(false)} 
      />
    </>
  );
}