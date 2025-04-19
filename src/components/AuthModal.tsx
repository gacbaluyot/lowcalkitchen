import React, { useEffect, useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Auth } from '@supabase/auth-ui-react';
import { ThemeSupa } from '@supabase/auth-ui-shared';
import { supabase } from '@/lib/supabase';
import type { AuthChangeEvent, Session } from '@supabase/supabase-js';

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
  
      // 2️⃣ If it doesn’t exist, proceed with signup
      const { data, error } = await supabase.auth.signUp({ email, password });
      console.log(data);
  
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
            className="fixed inset-0 bg-black/30 backdrop-blur-[2px] z-[100]"
          />

          <div className="fixed inset-0 z-[101] flex items-center justify-center p-4 sm:p-6">
            <motion.div
              initial={{ opacity: 0, scale: 0.95, y: 20 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.95, y: 20 }}
              transition={{ 
                type: 'spring',
                stiffness: 300,
                damping: 25
              }}
              className="w-full max-w-md bg-white dark:bg-gray-800 rounded-2xl shadow-xl overflow-hidden"
            >
              <div className="p-6 sm:p-8">
                <div className="flex justify-between items-center mb-6 sm:mb-8">
                  <h2 className="text-xl sm:text-2xl font-bold text-gray-900 dark:text-white">
                    {isSignUp ? 'Create an Account' : 'Welcome Back'}
                  </h2>
                  <button
                    onClick={onClose}
                    className="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200 transition-colors"
                  >
                    <svg className="w-5 h-5 sm:w-6 sm:h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth={2}
                        d="M6 18L18 6M6 6l12 12"
                      />
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

                {isSignUp ? (
                  <form onSubmit={handleSignUp} className="space-y-6">
                    <div className="space-y-2">
                      <label htmlFor="email" className="block text-base text-gray-900 dark:text-gray-100">
                        Email
                      </label>
                      <input
                        type="email"
                        id="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        className={`block w-full px-4 py-3 rounded-lg border ${error ? 'border-red-500' : 'border-gray-300'} focus:border-orange-500 focus:ring-orange-500 bg-white dark:bg-gray-800 dark:border-gray-600 dark:text-white text-base`}
                        required
                        disabled={isLoading}
                      />
                    </div>
                    <div className="space-y-2">
                      <label htmlFor="password" className="block text-base text-gray-900 dark:text-gray-100">
                        Password
                      </label>
                      <div className="relative">
                        <input
                          type={showPassword ? "text" : "password"}
                          id="password"
                          value={password}
                          onChange={(e) => setPassword(e.target.value)}
                          className={`block w-full px-4 py-3 rounded-lg border ${error ? 'border-red-500' : 'border-gray-300'} focus:border-orange-500 focus:ring-orange-500 bg-white dark:bg-gray-800 dark:border-gray-600 dark:text-white text-base pr-12`}
                          required
                          disabled={isLoading}
                        />
                        <button
                          type="button"
                          onClick={() => setShowPassword(!showPassword)}
                          className="absolute inset-y-0 right-0 flex items-center pr-3 text-gray-400 hover:text-gray-500 focus:outline-none"
                          disabled={isLoading}
                        >
                          {showPassword ? (
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                              <path strokeLinecap="round" strokeLinejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88" />
                            </svg>
                          ) : (
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-5 h-5">
                              <path strokeLinecap="round" strokeLinejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                              <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                          )}
                        </button>
                      </div>
                    </div>
                    <button
                      type="submit"
                      className="w-full py-3 px-4 text-base font-semibold text-white bg-orange-500 hover:bg-orange-600 rounded-lg transition duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500 disabled:opacity-50 disabled:cursor-not-allowed"
                      disabled={isLoading}
                    >
                      {isLoading ? 'Signing up...' : 'Sign Up'}
                    </button>
                    <p className="text-center text-base text-gray-600 dark:text-gray-400">
                      Already have an account?{' '}
                      <button
                        type="button"
                        onClick={() => {
                          setIsSignUp(false);
                          setError('');
                        }}
                        className="font-medium text-orange-500 hover:text-orange-600 dark:text-orange-400 dark:hover:text-orange-300"
                        disabled={isLoading}
                      >
                        Sign in
                      </button>
                    </p>
                  </form>
                ) : (
                  <>
                    <Auth
                      supabaseClient={supabase}
                      view="sign_in"
                      appearance={{
                        theme: ThemeSupa,
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
                        style: {
                          input: {
                            padding: '12px 16px',
                            borderRadius: '8px',
                            fontSize: '16px',
                          },
                          label: {
                            fontSize: '16px',
                            marginBottom: '8px',
                          },
                          button: {
                            padding: '12px 16px',
                            borderRadius: '8px',
                            fontSize: '16px',
                            fontWeight: '600',
                          },
                        },
                        className: {
                          container: 'space-y-6',
                          button: 'w-full py-3 px-4',
                          input: 'w-full',
                          label: 'block text-base',
                          anchor: 'text-orange-500 hover:text-orange-600',
                          divider: 'my-6',
                          message: 'text-base',
                        },
                      }}
                      providers={['google']}
                      providerScopes={{
                        google: 'profile email',
                      }}
                      queryParams={{
                        access_type: 'offline',
                        prompt: 'consent',
                      }}
                      theme={localStorage.getItem('theme') === 'dark' ? 'dark' : 'light'}
                      redirectTo={import.meta.env.PUBLIC_SUPABASE_OAUTH_CALLBACK}
                      localization={{
                        variables: {
                          sign_up: {
                            link_text: '',
                          },
                        },
                      }}
                      onlyThirdPartyProviders={false}
                    />
                    <div className="mt-4">
                      <p className="text-center text-base text-gray-600 dark:text-gray-400">
                        Don't have an account?{' '}
                        <button
                          type="button"
                          onClick={() => {
                            setIsSignUp(true);
                            setError('');
                          }}
                          className="font-medium text-orange-500 hover:text-orange-600 dark:text-orange-400 dark:hover:text-orange-300"
                        >
                          Sign up
                        </button>
                      </p>
                    </div>
                  </>
                )}
              </div>
            </motion.div>
          </div>
        </>
      )}
    </AnimatePresence>
  );
}
