import React, { useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Auth } from '@supabase/auth-ui-react';
import { ThemeSupa } from '@supabase/auth-ui-shared';
import { supabase } from '@/lib/supabase';
import toast, { Toaster } from 'react-hot-toast';

interface AuthModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export default function AuthModal({ isOpen, onClose }: AuthModalProps) {
  useEffect(() => {
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, session) => {
      if (event === 'SIGNED_IN') {
        // No need to manually store session - Supabase handles this
        toast.success('Successfully signed in!');
        onClose();
      } else if (event === 'SIGNED_OUT') {
        toast.success('Signed out');
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
                  <h2 className="text-xl sm:text-2xl font-bold text-gray-900 dark:text-white">Welcome Back</h2>
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

                <Auth
                  supabaseClient={supabase}
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
                        space: {
                          spaceSmall: '4px',
                          spaceMedium: '8px',
                          spaceLarge: '16px',
                          labelBottomMargin: '8px',
                          anchorBottomMargin: '4px',
                          emailInputSpacing: '4px',
                          socialAuthSpacing: '12px',
                          buttonPadding: '10px 15px',
                          inputPadding: '10px 15px',
                        },
                        borderWidths: {
                          buttonBorderWidth: '1px',
                          inputBorderWidth: '1px',
                        },
                        radii: {
                          borderRadiusButton: '8px',
                          buttonBorderRadius: '8px',
                          inputBorderRadius: '8px',
                        },
                      },
                    },
                    className: {
                      container: 'auth-container',
                      button: 'auth-button',
                      input: 'auth-input',
                      label: 'auth-label',
                      anchor: 'auth-anchor',
                      divider: 'auth-divider',
                      message: 'auth-message',
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
                />
              </div>
            </motion.div>
          </div>

          <Toaster
            position="top-right"
            toastOptions={{
              duration: 3000,
              style: {
                background: '#333',
                color: '#fff',
              },
              success: {
                iconTheme: {
                  primary: '#4ade80',
                  secondary: '#fff',
                },
              },
            }}
          />
        </>
      )}
    </AnimatePresence>
  );
}
