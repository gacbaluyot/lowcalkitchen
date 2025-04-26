import React, { useEffect, useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Auth } from '@supabase/auth-ui-react';
import { ThemeSupa } from '@supabase/auth-ui-shared';
import { supabase } from '@/lib/supabase';
import type { AuthChangeEvent, Session } from '@supabase/supabase-js';
import '@/styles/auth.css';  // Static import for auth styles

interface AuthModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export default function AuthModal({ isOpen, onClose }: AuthModalProps) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isSignUp, setIsSignUp] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [error, setError] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const handleSignUp = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setSuccessMessage('');
    setIsLoading(true);
  
    try {
      // 1️⃣ Check if this email already exists in your public.users table
      const { data: existingUser, error: userError } = await supabase
        .from('users')
        .select('id')
        .eq('email', email)
        .maybeSingle();

      if (userError) {
        console.error('Error querying users table:', userError);
        setError('Unable to validate email. Please try again later.');
        return;
      }
  
      if (existingUser) {
        setError('Email already exists. Please log in or reset your password.');
        return;
      }
  
      // 2️⃣ If it doesn't exist, proceed with signup
      const { data, error } = await supabase.auth.signUp({ email, password });
  
      if (error) {
        setError(error.message);
      } else {
        setSuccessMessage('Signup successful! Please check your email for confirmation.');
      }
    } catch (err) {
      setError('Something went wrong. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };
  

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setIsLoading(true);
    
    try {
      const { error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) {
        setError(error.message);
      }
    } catch (err) {
      setError('An unexpected error occurred. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event: AuthChangeEvent, session: Session | null) => {
      if (event === 'SIGNED_IN') {
        onClose();
      }
    });

    return () => {
      subscription.unsubscribe();
    };
  }, [onClose]);

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            className="fixed inset-0 bg-black/30 backdrop-blur-[2px] z-[60]"
          />

          <div className="fixed inset-0 z-[61] flex items-center justify-center p-4 sm:p-6">
            <motion.div
              initial={{ opacity: 0, scale: 0.95, y: 20 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.95, y: 20 }}
              transition={{ 
                type: 'spring',
                stiffness: 300,
                damping: 25
              }}
              className="w-full max-w-md bg-white dark:bg-gray-800 rounded-2xl shadow-xl overflow-hidden relative"
            >
              <div className="p-6 sm:p-8">
                <div className="flex justify-between items-center mb-6">
                  <h2 className="text-2xl font-bold text-gray-900 dark:text-white">
                    {isSignUp ? 'Create an Account' : 'Welcome Back'}
                  </h2>
                  <button
                    onClick={onClose}
                    className="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200 transition-colors"
                  >
                    <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>

                {error && (
                  <div className="mb-4 p-3 rounded-lg bg-red-50 dark:bg-red-900/20 text-red-600 dark:text-red-400 text-sm">
                    {error}
                  </div>
                )}

                {successMessage && (
                  <div className="mb-4 p-3 rounded-lg bg-green-50 dark:bg-green-900/20 text-green-600 dark:text-green-400 text-sm">
                    {successMessage}
                  </div>
                )}

                <Auth
                  supabaseClient={supabase}
                  view={isSignUp ? "sign_up" : "sign_in"}
                  appearance={{
                    theme: ThemeSupa,
                    extend: true,
                    variables: {
                      default: {
                        colors: {
                          brand: '#f97316',
                          brandAccent: '#ea580c',
                          brandButtonText: 'white',
                          defaultButtonBackground: '#f3f4f6',
                          defaultButtonBackgroundHover: '#e5e7eb',
                          defaultButtonBorder: 'transparent',
                          defaultButtonText: '#374151',
                          dividerBackground: '#e5e7eb',
                          inputBackground: 'transparent',
                          inputBorder: '#d1d5db',
                          inputBorderHover: '#f97316',
                          inputBorderFocus: '#f97316',
                          inputText: 'inherit',
                          messageText: '#6b7280',
                          messageTextDanger: '#ef4444',
                        },
                      },
                    },
                    className: {
                      container: 'auth-container',
                      button: 'auth-button',
                      anchor: 'auth-anchor',
                      divider: 'auth-divider',
                      label: 'auth-label',
                      input: 'auth-input',
                      loader: 'auth-loader',
                      message: 'auth-message'
                    },
                    style: {
                      button: { padding: '12px 16px', borderRadius: '8px', fontSize: '16px', fontWeight: '600' },
                      anchor: { color: '#f97316' },
                      input: { padding: '12px 16px', borderRadius: '8px', fontSize: '16px' },
                      label: { fontSize: '16px', marginBottom: '8px' },
                    },
                  }}
                  providers={['google']}
                  theme={localStorage.getItem('theme') === 'dark' ? 'dark' : 'light'}
                  localization={{
                    variables: {
                      sign_up: {
                        email_label: 'Email address',
                        password_label: 'Create a password',
                        button_label: 'Sign up',
                        social_provider_text: 'Sign in with {{provider}}',
                        link_text: 'Don\'t have an account? Sign up',
                      },
                      sign_in: {
                        email_label: 'Email address',
                        password_label: 'Your password',
                        button_label: 'Sign in',
                        social_provider_text: 'Sign in with {{provider}}',
                        link_text: 'Already have an account? Sign in',
                      },
                    },
                  }}
                />
              </div>
            </motion.div>
          </div>
        </>
      )}
    </AnimatePresence>
  );
}
