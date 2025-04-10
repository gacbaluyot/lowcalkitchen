import React from 'react';
import { motion } from 'framer-motion';

export default function Logo() {
  return (
    <motion.div 
      className="flex items-center gap-3"
      whileHover={{ scale: 1.05 }}
      transition={{ type: "spring", stiffness: 400, damping: 10 }}
    >
      {/* Logo Icon */}
      <div className="relative w-10 h-10">
        {/* Main Circle */}
        <motion.div 
          className="absolute inset-0 bg-primary-500 rounded-full"
          initial={{ scale: 0 }}
          animate={{ scale: 1 }}
          transition={{ type: "spring", stiffness: 260, damping: 20 }}
        />
        
        {/* Chicken Body */}
        <motion.div 
          className="absolute inset-0"
          animate={{ rotate: [0, -5, 5, 0] }}
          transition={{ duration: 2, repeat: Infinity, ease: "easeInOut" }}
        >
          <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-6 h-6">
            {/* Chicken Body (Egg Shape) */}
            <div className="absolute w-5 h-6 bg-white rounded-full transform rotate-[30deg]"></div>
            
            {/* Wing */}
            <motion.div 
              className="absolute top-1/2 right-0 w-2.5 h-3 bg-white rounded-r-full transform -translate-y-1/2 rotate-[30deg]"
              animate={{ rotate: [30, 40, 30] }}
              transition={{ duration: 1, repeat: Infinity, ease: "easeInOut" }}
            />
            
            {/* Head */}
            <motion.div 
              className="absolute top-0 left-1/2 w-3 h-3.5 bg-white rounded-full transform -translate-x-1/2 -translate-y-1/4"
              animate={{ rotate: [0, -5, 5, 0] }}
              transition={{ duration: 2, repeat: Infinity, ease: "easeInOut", delay: 0.5 }}
            >
              {/* Comb */}
              <div className="absolute -top-1 left-1/2 w-2 h-2 bg-primary-600 transform -translate-x-1/2">
                <div className="absolute top-0 left-0 w-2 h-1 bg-primary-600 rounded-t-full"></div>
              </div>
              
              {/* Beak */}
              <div className="absolute top-1/2 right-0 w-1.5 h-1.5 bg-primary-600 transform translate-x-1/4 rotate-45"></div>
            </motion.div>
          </div>
        </motion.div>
      </div>

      {/* Text */}
      <motion.div 
        className="flex flex-col"
        initial={{ opacity: 0, x: -20 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ duration: 0.5, delay: 0.2 }}
      >
        <span className="text-xl font-bold text-gray-900 dark:text-white leading-tight">
          LowCal
        </span>
        <span className="text-xl font-bold text-primary-600 dark:text-primary-400 leading-tight">
          Kitchen
        </span>
      </motion.div>
    </motion.div>
  );
}