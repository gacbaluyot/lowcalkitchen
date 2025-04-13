import { createClient } from '@supabase/supabase-js';

export type Recipe = {
  id: string;
  title: string;
  description: string;
  image: string | null;
  cooking_time: number;
  servings: number;
  ingredients: string[];
  instructions: string[];
  tags: string[];
  publish_date: string;
  calories: number;
  protein: number;
  carbs: number;
  fat: number;
  created_at: string;
  slug: string;
};

export type BlogPost = {
  id: string;
  title: string;
  slug: string;
  content: string;
  excerpt: string;
  image: string | null;
  author: string;
  publish_date: string;
  tags: string[];
  created_at: string;
  reading_time: number;
};

export type CategoryGroup = {
  id: string;
  name: string;
  icon: string;
  order: number;
  categories: Category[];
};

export type Category = {
  id: string;
  name: string;
  slug: string;
  icon: string;
  color: string;
  group_id: string;
  order: number;
};

const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;
const supabaseKey = import.meta.env.PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Missing environment variables PUBLIC_SUPABASE_URL and PUBLIC_SUPABASE_ANON_KEY');
}

export const supabase = createClient(supabaseUrl, supabaseKey, {
  auth: {
    storageKey: 'supabase-auth',
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: true,
    flowType: 'pkce',
  },
});
