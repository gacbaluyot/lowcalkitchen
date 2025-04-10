import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { supabase } from '@/lib/supabase';

interface Category {
  id: string;
  name: string;
  slug: string;
}

interface RecipeEditorProps {
  categories: Category[];
}

export default function RecipeEditor({ categories }: RecipeEditorProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [mode, setMode] = useState<'create' | 'edit'>('create');
  const [recipe, setRecipe] = useState({
    title: '',
    description: '',
    image: '',
    cooking_time: 0,
    servings: 0,
    ingredients: [''],
    instructions: [''],
    tags: [],
    calories: 0,
    protein: 0,
    carbs: 0,
    fat: 0,
    slug: ''
  });

  useEffect(() => {
    const handleOpen = async (event: CustomEvent) => {
      const { mode, recipeId } = event.detail;
      setMode(mode);

      if (mode === 'edit' && recipeId) {
        const { data: recipe } = await supabase
          .from('recipes')
          .select('*')
          .eq('id', recipeId)
          .single();

        if (recipe) {
          setRecipe(recipe);
        }
      }

      setIsOpen(true);
    };

    const handleDelete = async (event: CustomEvent) => {
      const { recipeId } = event.detail;
      
      try {
        const { error } = await supabase
          .from('recipes')
          .delete()
          .eq('id', recipeId);

        if (error) throw error;
        
        // Dispatch event to notify of recipe update
        window.dispatchEvent(new CustomEvent('recipeUpdated'));
      } catch (error) {
        console.error('Error deleting recipe:', error);
        alert('Error deleting recipe');
      }
    };

    window.addEventListener('openRecipeEditor', handleOpen as EventListener);
    window.addEventListener('deleteRecipe', handleDelete as EventListener);

    return () => {
      window.removeEventListener('openRecipeEditor', handleOpen as EventListener);
      window.removeEventListener('deleteRecipe', handleDelete as EventListener);
    };
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      const slug = recipe.title
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/(^-|-$)/g, '');

      const recipeData = {
        ...recipe,
        slug,
        publish_date: new Date().toISOString()
      };

      if (mode === 'create') {
        const { error } = await supabase
          .from('recipes')
          .insert([recipeData]);

        if (error) throw error;
      } else {
        const { error } = await supabase
          .from('recipes')
          .update(recipeData)
          .eq('id', recipe.id);

        if (error) throw error;
      }

      // Dispatch event to notify of recipe update
      window.dispatchEvent(new CustomEvent('recipeUpdated'));
      setIsOpen(false);
    } catch (error) {
      console.error('Error saving recipe:', error);
      alert('Error saving recipe');
    }
  };

  const addListItem = (field: 'ingredients' | 'instructions') => {
    setRecipe({
      ...recipe,
      [field]: [...recipe[field], '']
    });
  };

  const removeListItem = (field: 'ingredients' | 'instructions', index: number) => {
    setRecipe({
      ...recipe,
      [field]: recipe[field].filter((_, i) => i !== index)
    });
  };

  const updateListItem = (field: 'ingredients' | 'instructions', index: number, value: string) => {
    const newList = [...recipe[field]];
    newList[index] = value;
    setRecipe({
      ...recipe,
      [field]: newList
    });
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <div className="fixed inset-0 z-50 overflow-y-auto">
          <div className="flex items-center justify-center min-h-screen px-4">
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="fixed inset-0 bg-black/50"
              onClick={() => setIsOpen(false)}
            />

            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              exit={{ opacity: 0, scale: 0.95 }}
              className="relative bg-white dark:bg-gray-800 rounded-lg shadow-xl max-w-4xl w-full mx-auto p-6"
            >
              <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-6">
                {mode === 'create' ? 'Add New Recipe' : 'Edit Recipe'}
              </h2>

              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Title
                    </label>
                    <input
                      type="text"
                      value={recipe.title}
                      onChange={(e) => setRecipe({ ...recipe, title: e.target.value })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Image URL
                    </label>
                    <input
                      type="url"
                      value={recipe.image}
                      onChange={(e) => setRecipe({ ...recipe, image: e.target.value })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                    Description
                  </label>
                  <textarea
                    value={recipe.description}
                    onChange={(e) => setRecipe({ ...recipe, description: e.target.value })}
                    className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                    rows={3}
                    required
                  />
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Cooking Time (minutes)
                    </label>
                    <input
                      type="number"
                      value={recipe.cooking_time}
                      onChange={(e) => setRecipe({ ...recipe, cooking_time: parseInt(e.target.value) })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Servings
                    </label>
                    <input
                      type="number"
                      value={recipe.servings}
                      onChange={(e) => setRecipe({ ...recipe, servings: parseInt(e.target.value) })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>
                </div>

                <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Calories
                    </label>
                    <input
                      type="number"
                      value={recipe.calories}
                      onChange={(e) => setRecipe({ ...recipe, calories: parseInt(e.target.value) })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Protein (g)
                    </label>
                    <input
                      type="number"
                      value={recipe.protein}
                      onChange={(e) => setRecipe({ ...recipe, protein: parseInt(e.target.value) })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Carbs (g)
                    </label>
                    <input
                      type="number"
                      value={recipe.carbs}
                      onChange={(e) => setRecipe({ ...recipe, carbs: parseInt(e.target.value) })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                      Fat (g)
                    </label>
                    <input
                      type="number"
                      value={recipe.fat}
                      onChange={(e) => setRecipe({ ...recipe, fat: parseInt(e.target.value) })}
                      className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                      required
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                    Categories
                  </label>
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-2">
                    {categories.map((category) => (
                      <label key={category.id} className="flex items-center space-x-2">
                        <input
                          type="checkbox"
                          checked={recipe.tags.includes(category.slug)}
                          onChange={(e) => {
                            if (e.target.checked) {
                              setRecipe({
                                ...recipe,
                                tags: [...recipe.tags, category.slug]
                              });
                            } else {
                              setRecipe({
                                ...recipe,
                                tags: recipe.tags.filter(tag => tag !== category.slug)
                              });
                            }
                          }}
                          className="rounded border-gray-300 dark:border-gray-600"
                        />
                        <span className="text-sm text-gray-700 dark:text-gray-300">
                          {category.name}
                        </span>
                      </label>
                    ))}
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                    Ingredients
                  </label>
                  {recipe.ingredients.map((ingredient, index) => (
                    <div key={index} className="flex gap-2 mb-2">
                      <input
                        type="text"
                        value={ingredient}
                        onChange={(e) => updateListItem('ingredients', index, e.target.value)}
                        className="flex-1 px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                        required
                      />
                      <button
                        type="button"
                        onClick={() => removeListItem('ingredients', index)}
                        className="px-3 py-2 text-red-600 hover:text-red-800"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                  <button
                    type="button"
                    onClick={() => addListItem('ingredients')}
                    className="text-primary-600 hover:text-primary-700"
                  >
                    + Add Ingredient
                  </button>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                    Instructions
                  </label>
                  {recipe.instructions.map((instruction, index) => (
                    <div key={index} className="flex gap-2 mb-2">
                      <textarea
                        value={instruction}
                        onChange={(e) => updateListItem('instructions', index, e.target.value)}
                        className="flex-1 px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700"
                        rows={2}
                        required
                      />
                      <button
                        type="button"
                        onClick={() => removeListItem('instructions', index)}
                        className="px-3 py-2 text-red-600 hover:text-red-800"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                  <button
                    type="button"
                    onClick={() => addListItem('instructions')}
                    className="text-primary-600 hover:text-primary-700"
                  >
                    + Add Instruction
                  </button>
                </div>

                <div className="flex justify-end gap-4">
                  <button
                    type="button"
                    onClick={() => setIsOpen(false)}
                    className="px-4 py-2 text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg"
                  >
                    Cancel
                  </button>
                  <button
                    type="submit"
                    className="px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
                  >
                    {mode === 'create' ? 'Create Recipe' : 'Update Recipe'}
                  </button>
                </div>
              </form>
            </motion.div>
          </div>
        </div>
      )}
    </AnimatePresence>
  );
}