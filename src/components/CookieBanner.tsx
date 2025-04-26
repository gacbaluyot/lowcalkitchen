import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

export default function CookieBanner() {
  const [showBanner, setShowBanner] = useState(false);
  const [showDetails, setShowDetails] = useState(false);

  useEffect(() => {
    // Check if user has already accepted cookies
    const cookiesAccepted = localStorage.getItem('cookiesAccepted');
    if (!cookiesAccepted) {
      setShowBanner(true);
    }
  }, []);

  const acceptCookies = () => {
    localStorage.setItem('cookiesAccepted', 'true');
    setShowBanner(false);
    
    // Dispatch event for analytics (if needed)
    window.dispatchEvent(new CustomEvent('cookiesAccepted'));
  };

  const acceptEssentialOnly = () => {
    localStorage.setItem('cookiesAccepted', 'essential');
    setShowBanner(false);
    
    // Dispatch event for analytics (if needed)
    window.dispatchEvent(new CustomEvent('cookiesEssentialOnly'));
  };

  return (
    <AnimatePresence>
      {showBanner && (
        <motion.div
          initial={{ y: 100, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          exit={{ y: 100, opacity: 0 }}
          className="fixed bottom-0 left-0 right-0 bg-white dark:bg-gray-800 shadow-lg z-50 border-t border-gray-200 dark:border-gray-700"
        >
          <div className="max-w-7xl mx-auto p-4 md:p-6">
            <div className="flex flex-col gap-4">
              <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                <div className="flex-1">
                  <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">We value your privacy</h3>
                  <p className="text-gray-600 dark:text-gray-300 text-sm">
                    We use cookies to enhance your browsing experience, serve personalized content, and analyze our traffic.
                    <button 
                      onClick={() => setShowDetails(!showDetails)}
                      className="text-primary-600 dark:text-primary-400 hover:text-primary-700 dark:hover:text-primary-300 ml-1 underline"
                    >
                      {showDetails ? 'Show less' : 'Read more'}
                    </button>
                  </p>
                </div>
                <div className="flex gap-3 w-full md:w-auto">
                  <button
                    onClick={acceptEssentialOnly}
                    className="flex-1 md:flex-none px-4 py-2 text-gray-700 dark:text-gray-300 bg-gray-100 dark:bg-gray-700 rounded-lg hover:bg-gray-200 dark:hover:bg-gray-600 transition-colors"
                  >
                    Essential Only
                  </button>
                  <button
                    onClick={acceptCookies}
                    className="flex-1 md:flex-none px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors"
                  >
                    Accept All
                  </button>
                </div>
              </div>

              <AnimatePresence>
                {showDetails && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    className="overflow-hidden"
                  >
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4 pt-4 border-t border-gray-200 dark:border-gray-700">
                      <div>
                        <h4 className="font-semibold text-gray-900 dark:text-white mb-2">Essential Cookies</h4>
                        <p className="text-sm text-gray-600 dark:text-gray-300">
                          These cookies are necessary for the website to function and cannot be switched off.
                        </p>
                      </div>
                      <div>
                        <h4 className="font-semibold text-gray-900 dark:text-white mb-2">Analytics Cookies</h4>
                        <p className="text-sm text-gray-600 dark:text-gray-300">
                          Help us understand how visitors interact with our website.
                        </p>
                      </div>
                      <div>
                        <h4 className="font-semibold text-gray-900 dark:text-white mb-2">Marketing Cookies</h4>
                        <p className="text-sm text-gray-600 dark:text-gray-300">
                          Used to deliver personalized advertisements and track their performance.
                        </p>
                      </div>
                    </div>
                    <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700">
                      <p className="text-sm text-gray-600 dark:text-gray-300">
                        For more information about our cookie practices, please visit our{' '}
                        <a href="/privacy" className="text-primary-600 dark:text-primary-400 hover:underline">
                          Privacy Policy
                        </a>
                        .
                      </p>
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}