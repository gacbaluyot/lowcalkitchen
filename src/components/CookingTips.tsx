import React from 'react';
import { motion } from 'framer-motion';
import AnimatedCard from './AnimatedCard';

export default function CookingTips() {
  const tips = [
    {
      title: "Meal Prep Success",
      description: "Plan your meals ahead and prep ingredients in bulk to save time and stay on track with your nutrition goals.",
      icon: "📝"
    },
    {
      title: "Protein First",
      description: "Start with your protein source when planning meals. It helps with satiety and muscle maintenance.",
      icon: "🥩"
    },
    {
      title: "Smart Substitutions",
      description: "Use Greek yogurt instead of sour cream, cauliflower rice instead of regular rice to reduce calories.",
      icon: "🔄"
    },
    {
      title: "Portion Control",
      description: "Use smaller plates and measure portions to maintain calorie control without feeling deprived.",
      icon: "⚖️"
    }
  ];

  return (
    <section className="mb-16">
      <h2 className="text-3xl font-bold text-gray-900 dark:text-white mb-8 text-center">Cooking Tips & Tricks</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {tips.map((tip, index) => (
          <AnimatedCard key={tip.title} delay={index * 0.1}>
            <div className="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg h-full">
              <div className="text-4xl mb-4">{tip.icon}</div>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-3">{tip.title}</h3>
              <p className="text-gray-600 dark:text-gray-300">{tip.description}</p>
            </div>
          </AnimatedCard>
        ))}
      </div>
    </section>
  );
}