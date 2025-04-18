import React, { useState, useRef, useEffect } from 'react';
import { MacroPieChart } from "@/components/MacroPieChart.tsx";
import { motion } from 'framer-motion';

interface TDEEFormData {
  age: number;
  gender: 'male' | 'female';
  weight: number;
  height: number;
  activityLevel: keyof typeof activityLevels;
  goal: keyof typeof goals;
}

const activityLevels = {
  sedentary: { label: 'Sedentary (office job)', multiplier: 1.2 },
  light: { label: 'Light Exercise (1-2 days/week)', multiplier: 1.375 },
  moderate: { label: 'Moderate Exercise (3-5 days/week)', multiplier: 1.55 },
  heavy: { label: 'Heavy Exercise (6-7 days/week)', multiplier: 1.725 },
  athlete: { label: 'Athlete (2x per day)', multiplier: 1.9 },
};

const goals = {
  lose: { label: 'Lose Weight', multiplier: 0.8 },
  maintain: { label: 'Maintain Weight', multiplier: 1 },
  gain: { label: 'Gain Weight', multiplier: 1.2 },
};

export default function TDEECalculator() {
  const [formData, setFormData] = useState<TDEEFormData>({
    age: 25,
    gender: 'male',
    weight: 70,
    height: 170,
    activityLevel: 'moderate',
    goal: 'maintain',
  });

  const [results, setResults] = useState<{
    bmr: number;
    tdee: number;
    adjustedCalories: number;
    protein: number;
    carbs: number;
    fats: number;
  } | null>(null);
  const [showModal, setShowModal] = useState(false);

  const calculateTDEE = () => {
    // BMR calculation using Mifflin-St Jeor Equation
    let bmr;
    if (formData.gender === 'male') {
      bmr = 10 * formData.weight + 6.25 * formData.height - 5 * formData.age + 5;
    } else {
      bmr = 10 * formData.weight + 6.25 * formData.height - 5 * formData.age - 161;
    }

    
    const tdee = bmr * activityLevels[formData.activityLevel].multiplier;
    const adjustedCalories = tdee * goals[formData.goal].multiplier;

    // Calculate macros
    // Protein: 2g per kg of body weight
    const protein = formData.weight * 2;
    // Fat: 25% of calories
    const fats = (adjustedCalories * 0.25) / 9;
    // Remaining calories from carbs
    const carbs = (adjustedCalories - protein * 4 - fats * 9) / 4;

    setResults({
      bmr: Math.round(bmr),
      tdee: Math.round(tdee),
      adjustedCalories: Math.round(adjustedCalories),
      protein: Math.round(protein),
      carbs: Math.round(carbs),
      fats: Math.round(fats),
    });
    setShowModal(true);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    calculateTDEE();
  };

  return (
    <div className="max-w-4xl mx-auto">
      <form
        onSubmit={handleSubmit}
        className="bg-white dark:bg-gray-800 rounded-xl p-6 shadow-lg mb-8"
      >
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Age
            </label>
            <input
              type="number"
              min="15"
              max="100"
              value={formData.age}
              onChange={(e) => setFormData({ ...formData, age: parseInt(e.target.value) })}
              className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Gender
            </label>
            <select
              value={formData.gender}
              onChange={(e) =>
                setFormData({ ...formData, gender: e.target.value as 'male' | 'female' })
              }
              className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Weight (kg)
            </label>
            <input
              type="number"
              min="30"
              max="300"
              value={formData.weight}
              onChange={(e) => setFormData({ ...formData, weight: parseInt(e.target.value) })}
              className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Height (cm)
            </label>
            <input
              type="number"
              min="100"
              max="250"
              value={formData.height}
              onChange={(e) => setFormData({ ...formData, height: parseInt(e.target.value) })}
              className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Activity Level
            </label>
            <select
              value={formData.activityLevel}
              onChange={(e) => setFormData({ ...formData, activityLevel: e.target.value as keyof typeof activityLevels })}
              className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              {Object.entries(activityLevels).map(([key, { label }]) => (
                <option key={key} value={key}>
                  {label}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Goal
            </label>
            <select
              value={formData.goal}
              onChange={(e) => setFormData({ ...formData, goal: e.target.value as keyof typeof goals })}
              className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            >
              {Object.entries(goals).map(([key, { label }]) => (
                <option key={key} value={key}>
                  {label}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="mt-6">
          <motion.button
            type="submit"
            className="w-full bg-primary-600 text-white px-6 py-3 rounded-lg hover:bg-primary-700 transition-colors"
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
          >
            Calculate
          </motion.button>
        </div>
      </form>

      {showModal && results && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <motion.div
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.9 }}
            className="bg-white dark:bg-gray-800 rounded-xl p-4 sm:p-6 shadow-lg w-full max-w-2xl mx-4 sm:mx-0"
          >
            <div className="flex justify-between items-center mb-4 sm:mb-6">
              <h2 className="text-xl sm:text-2xl font-bold text-gray-900 dark:text-white">Your Results</h2>
              <button
                onClick={() => setShowModal(false)}
                className="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
              >
                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 sm:gap-6 mb-6 sm:mb-8">
              <div className="bg-primary-50 dark:bg-primary-900/30 p-3 sm:p-4 rounded-lg">
                <div className="text-sm text-gray-600 dark:text-gray-400">
                  Base Metabolic Rate (BMR)
                </div>
                <div className="text-xl sm:text-2xl font-bold text-primary-600 dark:text-primary-400">
                  {results.bmr} kcal
                </div>
              </div>
              <div className="bg-primary-50 dark:bg-primary-900/30 p-3 sm:p-4 rounded-lg">
                <div className="text-sm text-gray-600 dark:text-gray-400">
                  Total Daily Energy Expenditure
                </div>
                <div className="text-xl sm:text-2xl font-bold text-primary-600 dark:text-primary-400">
                  {results.tdee} kcal
                </div>
              </div>
              <div className="bg-primary-50 dark:bg-primary-900/30 p-3 sm:p-4 rounded-lg">
                <div className="text-sm text-gray-600 dark:text-gray-400">Target Daily Calories</div>
                <div className="text-xl sm:text-2xl font-bold text-primary-600 dark:text-primary-400">
                  {results.adjustedCalories} kcal
                </div>
              </div>
            </div>

            <h3 className="text-lg sm:text-xl font-semibold text-gray-900 dark:text-white mb-4">
              Recommended Macro Split
            </h3>
            <div className="h-48 sm:h-64 relative mb-6 sm:mb-8">
              <MacroPieChart
                protein={results.protein}
                carbs={results.carbs}
                fats={results.fats}
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 sm:gap-6">
              <div className="bg-green-50 dark:bg-green-900/30 p-3 sm:p-4 rounded-lg">
                <div className="text-sm text-gray-600 dark:text-gray-400">Protein</div>
                <div className="text-xl sm:text-2xl font-bold text-green-600 dark:text-green-400">
                  {results.protein}g
                </div>
                <div className="text-sm text-gray-500 dark:text-gray-400">
                  {results.protein * 4} kcal
                </div>
              </div>
              <div className="bg-blue-50 dark:bg-blue-900/30 p-3 sm:p-4 rounded-lg">
                <div className="text-sm text-gray-600 dark:text-gray-400">Carbohydrates</div>
                <div className="text-xl sm:text-2xl font-bold text-blue-600 dark:text-blue-400">
                  {results.carbs}g
                </div>
                <div className="text-sm text-gray-500 dark:text-gray-400">
                  {results.carbs * 4} kcal
                </div>
              </div>
              <div className="bg-yellow-50 dark:bg-yellow-900/30 p-3 sm:p-4 rounded-lg">
                <div className="text-sm text-gray-600 dark:text-gray-400">Fats</div>
                <div className="text-xl sm:text-2xl font-bold text-yellow-600 dark:text-yellow-400">
                  {results.fats}g
                </div>
                <div className="text-sm text-gray-500 dark:text-gray-400">
                  {Math.round(results.fats * 9)} kcal
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      )}
    </div>
  );
}
