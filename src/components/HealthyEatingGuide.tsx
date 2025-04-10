import React from 'react';
import AnimatedCard from './AnimatedCard';

export default function HealthyEatingGuide() {
  return (
    <section className="mb-16 bg-gradient-to-br from-primary-50 to-white dark:from-primary-900/20 dark:to-gray-900 rounded-3xl p-8">
      <h2 className="text-3xl font-bold text-gray-900 dark:text-white mb-8 text-center">Healthy Eating Guide</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <AnimatedCard>
          <div className="bg-white dark:bg-gray-800 rounded-xl p-6 shadow-lg">
            <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-4">Macro Distribution</h3>
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <span className="text-gray-600 dark:text-gray-300">Protein</span>
                <div className="w-2/3 bg-gray-200 dark:bg-gray-700 rounded-full h-4">
                  <div className="bg-primary-500 h-4 rounded-full" style={{ width: '40%' }}></div>
                </div>
                <span className="text-gray-600 dark:text-gray-300">40%</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-gray-600 dark:text-gray-300">Carbs</span>
                <div className="w-2/3 bg-gray-200 dark:bg-gray-700 rounded-full h-4">
                  <div className="bg-primary-500 h-4 rounded-full" style={{ width: '35%' }}></div>
                </div>
                <span className="text-gray-600 dark:text-gray-300">35%</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-gray-600 dark:text-gray-300">Fats</span>
                <div className="w-2/3 bg-gray-200 dark:bg-gray-700 rounded-full h-4">
                  <div className="bg-primary-500 h-4 rounded-full" style={{ width: '25%' }}></div>
                </div>
                <span className="text-gray-600 dark:text-gray-300">25%</span>
              </div>
            </div>
          </div>
        </AnimatedCard>

        <AnimatedCard delay={0.2}>
          <div className="bg-white dark:bg-gray-800 rounded-xl p-6 shadow-lg">
            <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-4">Daily Goals</h3>
            <div className="space-y-4">
              <div className="flex items-center gap-4">
                <div className="p-3 bg-primary-100 dark:bg-primary-900/30 rounded-lg">
                  💧
                </div>
                <div>
                  <h4 className="font-medium text-gray-900 dark:text-white">Water Intake</h4>
                  <p className="text-sm text-gray-600 dark:text-gray-300">8-10 glasses per day</p>
                </div>
              </div>
              <div className="flex items-center gap-4">
                <div className="p-3 bg-primary-100 dark:bg-primary-900/30 rounded-lg">
                  🥗
                </div>
                <div>
                  <h4 className="font-medium text-gray-900 dark:text-white">Vegetables</h4>
                  <p className="text-sm text-gray-600 dark:text-gray-300">5 servings per day</p>
                </div>
              </div>
              <div className="flex items-center gap-4">
                <div className="p-3 bg-primary-100 dark:bg-primary-900/30 rounded-lg">
                  🏃‍♂️
                </div>
                <div>
                  <h4 className="font-medium text-gray-900 dark:text-white">Physical Activity</h4>
                  <p className="text-sm text-gray-600 dark:text-gray-300">30 minutes daily</p>
                </div>
              </div>
            </div>
          </div>
        </AnimatedCard>
      </div>
    </section>
  );
}