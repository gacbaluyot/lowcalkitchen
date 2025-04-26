import React from 'react';
import { motion } from 'framer-motion';
import AnimatedCard from './AnimatedCard';

interface Repository {
  name: string;
  description: string;
  url: string;
  stars: number;
  forks: number;
  language: string;
}

interface GitRepoListProps {
  repositories: Repository[];
}

export default function GitRepoList({ repositories }: GitRepoListProps) {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      {repositories.map((repo, index) => (
        <AnimatedCard key={repo.name} delay={index * 0.1}>
          <article className="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow h-full flex flex-col">
            <div className="p-6 flex flex-col flex-grow">
              <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3">
                <a 
                  href={repo.url}
                  className="hover:text-primary-600 dark:hover:text-primary-400"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  {repo.name}
                </a>
              </h3>
              <p className="text-gray-600 dark:text-gray-300 mb-4 flex-grow">
                {repo.description}
              </p>
              <div className="mt-auto flex items-center justify-between">
                <div className="flex items-center space-x-4">
                  <span className="text-sm text-gray-600 dark:text-gray-400">
                    {repo.language}
                  </span>
                  <span className="text-sm text-gray-600 dark:text-gray-400">
                    ⭐ {repo.stars}
                  </span>
                  <span className="text-sm text-gray-600 dark:text-gray-400">
                    🔄 {repo.forks}
                  </span>
                </div>
                <a
                  href={repo.url}
                  className="text-primary-600 dark:text-primary-400 hover:text-primary-700 dark:hover:text-primary-300 text-sm font-medium"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  View →
                </a>
              </div>
            </div>
          </article>
        </AnimatedCard>
      ))}
    </div>
  );
}