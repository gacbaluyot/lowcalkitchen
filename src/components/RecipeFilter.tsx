import React, { useState, useEffect } from 'react';
import type { CategoryGroup, Category } from '@/lib/supabase';

interface CategoryIcon {
  icon: string;
  color: string;
}

interface Recipe {
  title: string;
  description: string;
  tags: string[];
}

interface Props {
  categoryGroups: CategoryGroup[] | null;
  categoryIcons: Record<string, CategoryIcon>;
  allTags: string[];
  recipes: Recipe[] | null;
}

export default function RecipeFilter({ categoryGroups, categoryIcons, allTags, recipes }: Props) {
  const [searchTerm, setSearchTerm] = useState('');
  const [isSearching, setIsSearching] = useState(false);
  const [visibleCount, setVisibleCount] = useState(recipes?.length || 0);

  useEffect(() => {
    filterRecipes();
  }, [searchTerm]);

  const filterRecipes = () => {
    if (typeof document === 'undefined') return;

    setIsSearching(true);
    const recipesGrid = document.getElementById('recipes-grid');
    const noResults = document.getElementById('no-results');
    const searchTermLower = searchTerm.toLowerCase();

    // Get all recipe wrappers
    const recipeWrappers = document.querySelectorAll('.recipe-wrapper');

    // Count how many recipes are visible
    let visibleRecipes = 0;

    // Show/hide recipes based on search term
    recipeWrappers.forEach(wrapper => {
      const card = wrapper.querySelector('.recipe-card') as HTMLElement;
      if (!card) return;

      const title = card.querySelector('h3')?.textContent?.toLowerCase() || '';
      const description = card.querySelector('p')?.textContent?.toLowerCase() || '';
      const tags = card.getAttribute('data-tags');
      const recipeTags = tags ? JSON.parse(tags).map((tag: string) => tag.toLowerCase()) : [];

      const isMatch = !searchTermLower || 
        title.includes(searchTermLower) ||
        description.includes(searchTermLower) ||
        recipeTags.some(tag => tag.includes(searchTermLower));

      if (isMatch) {
        wrapper.classList.remove('hidden');
        visibleRecipes++;
      } else {
        wrapper.classList.add('hidden');
      }
    });

    setVisibleCount(visibleRecipes);

    // Show/hide no results message
    if (recipesGrid && noResults) {
      if (visibleRecipes === 0) {
        recipesGrid.classList.add('hidden');
        noResults.classList.remove('hidden');
      } else {
        recipesGrid.classList.remove('hidden');
        noResults.classList.add('hidden');
      }
    }

    setTimeout(() => setIsSearching(false), 100);
  };

  const handleSearch = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    filterRecipes();
  };

  return (
    <div className="space-y-8">
      <div className="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md">
        <div className="space-y-6">
          <div>
            <label htmlFor="search" className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              Search Recipes
            </label>
            <form onSubmit={handleSearch} className="relative">
              <input
                type="search"
                id="search"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                placeholder="Search by recipe name, description, or tags..."
                className="w-full px-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent pl-10"
              />
              <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg className="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
              </div>
            </form>
          </div>
        </div>
      </div>

      <div className="recipes-section">
        <div className="text-gray-600 dark:text-gray-300 mb-4">
          {isSearching ? (
            <span>Searching...</span>
          ) : (
            <span>Showing {visibleCount} recipes</span>
          )}
        </div>
      </div>
    </div>
  );
}