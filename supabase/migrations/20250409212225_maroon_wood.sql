/*
  # Add categories and category groups tables

  1. New Tables
    - `category_groups`
      - `id` (uuid, primary key)
      - `name` (text)
      - `icon` (text)
      - `order` (integer)
    
    - `categories`
      - `id` (uuid, primary key)
      - `name` (text)
      - `slug` (text)
      - `icon` (text)
      - `color` (text)
      - `group_id` (uuid, foreign key)
      - `order` (integer)

  2. Security
    - Enable RLS on both tables
    - Add policies for:
      - Public read access
      - Admin write access
*/

-- Create category groups table
CREATE TABLE category_groups (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  icon text NOT NULL,
  "order" integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create categories table
CREATE TABLE categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL UNIQUE,
  icon text NOT NULL,
  color text NOT NULL,
  group_id uuid REFERENCES category_groups(id),
  "order" integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE category_groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;

-- Add policies for category_groups
CREATE POLICY "Allow public read access for category_groups"
  ON category_groups
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Enable full access for admin users on category_groups"
  ON category_groups
  USING (
    auth.role() = 'authenticated' AND
    auth.email() = 'admin@lowcalrecipes.com'
  )
  WITH CHECK (
    auth.role() = 'authenticated' AND
    auth.email() = 'admin@lowcalrecipes.com'
  );

-- Add policies for categories
CREATE POLICY "Allow public read access for categories"
  ON categories
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Enable full access for admin users on categories"
  ON categories
  USING (
    auth.role() = 'authenticated' AND
    auth.email() = 'admin@lowcalrecipes.com'
  )
  WITH CHECK (
    auth.role() = 'authenticated' AND
    auth.email() = 'admin@lowcalrecipes.com'
  );

-- Insert category groups
INSERT INTO category_groups (name, icon, "order") VALUES
  ('Main Ingredients', '🍖', 1),
  ('Meal Types', '🍽️', 2),
  ('Cuisines', '🌎', 3),
  ('Dietary', '🥗', 4),
  ('Cooking Method', '👨‍🍳', 5),
  ('Other', '🏷️', 6);

-- Insert categories
WITH groups AS (
  SELECT id, name FROM category_groups
)
INSERT INTO categories (name, slug, icon, color, group_id, "order")
SELECT
  c.name,
  c.slug,
  c.icon,
  c.color,
  g.id,
  c.order
FROM (
  VALUES
    ('Chicken', 'chicken', '🍗', 'bg-orange-100 dark:bg-orange-900/30 text-orange-800 dark:text-orange-200', 'Main Ingredients', 1),
    ('Beef', 'beef', '🥩', 'bg-red-100 dark:bg-red-900/30 text-red-800 dark:text-red-200', 'Main Ingredients', 2),
    ('Fish', 'fish', '🐟', 'bg-cyan-100 dark:bg-cyan-900/30 text-cyan-800 dark:text-cyan-200', 'Main Ingredients', 3),
    ('Vegetarian', 'vegetarian', '🥬', 'bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-200', 'Main Ingredients', 4),
    
    ('Breakfast', 'breakfast', '🍳', 'bg-yellow-100 dark:bg-yellow-900/30 text-yellow-800 dark:text-yellow-200', 'Meal Types', 1),
    ('Lunch', 'lunch', '🥪', 'bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-200', 'Meal Types', 2),
    ('Dinner', 'dinner', '🍽️', 'bg-blue-100 dark:bg-blue-900/30 text-blue-800 dark:text-blue-200', 'Meal Types', 3),
    ('Dessert', 'dessert', '🍰', 'bg-pink-100 dark:bg-pink-900/30 text-pink-800 dark:text-pink-200', 'Meal Types', 4),
    ('Snack', 'snack', '🍿', 'bg-purple-100 dark:bg-purple-900/30 text-purple-800 dark:text-purple-200', 'Meal Types', 5),
    
    ('Italian', 'italian', '🍝', 'bg-green-100 dark:bg-green-900/30 text-green-800 dark:text-green-200', 'Cuisines', 1),
    ('Mexican', 'mexican', '🌮', 'bg-orange-100 dark:bg-orange-900/30 text-orange-800 dark:text-orange-200', 'Cuisines', 2),
    ('Asian', 'asian', '🥢', 'bg-fuchsia-100 dark:bg-fuchsia-900/30 text-fuchsia-800 dark:text-fuchsia-200', 'Cuisines', 3),
    ('Mediterranean', 'mediterranean', '🫒', 'bg-lime-100 dark:bg-lime-900/30 text-lime-800 dark:text-lime-200', 'Cuisines', 4),
    ('Thai', 'thai', '🇹🇭', 'bg-red-100 dark:bg-red-900/30 text-red-800 dark:text-red-200', 'Cuisines', 5),
    ('Greek', 'greek', '🇬🇷', 'bg-blue-100 dark:bg-blue-900/30 text-blue-800 dark:text-blue-200', 'Cuisines', 6),
    
    ('Low-Carb', 'low-carb', '📊', 'bg-teal-100 dark:bg-teal-900/30 text-teal-800 dark:text-teal-200', 'Dietary', 1),
    ('High-Protein', 'high-protein', '💪', 'bg-indigo-100 dark:bg-indigo-900/30 text-indigo-800 dark:text-indigo-200', 'Dietary', 2),
    ('Healthy', 'healthy', '🥗', 'bg-emerald-100 dark:bg-emerald-900/30 text-emerald-800 dark:text-emerald-200', 'Dietary', 3),
    
    ('Grilled', 'grilled', '🔥', 'bg-red-100 dark:bg-red-900/30 text-red-800 dark:text-red-200', 'Cooking Method', 1),
    ('Baked', 'baked', '🥖', 'bg-yellow-100 dark:bg-yellow-900/30 text-yellow-800 dark:text-yellow-200', 'Cooking Method', 2),
    ('Pan-Seared', 'pan-seared', '🍳', 'bg-yellow-100 dark:bg-yellow-900/30 text-yellow-800 dark:text-yellow-200', 'Cooking Method', 3),
    ('Stir-Fry', 'stir-fry', '🥘', 'bg-orange-100 dark:bg-orange-900/30 text-orange-800 dark:text-orange-200', 'Cooking Method', 4),
    ('Steamed', 'steamed', '♨️', 'bg-blue-100 dark:bg-blue-900/30 text-blue-800 dark:text-blue-200', 'Cooking Method', 5),
    
    ('Quick', 'quick', '⚡', 'bg-amber-100 dark:bg-amber-900/30 text-amber-800 dark:text-amber-200', 'Other', 1),
    ('Spicy', 'spicy', '🌶️', 'bg-rose-100 dark:bg-rose-900/30 text-rose-800 dark:text-rose-200', 'Other', 2),
    ('Meal Prep', 'meal-prep', '🥡', 'bg-purple-100 dark:bg-purple-900/30 text-purple-800 dark:text-purple-200', 'Other', 3),
    ('Comfort', 'comfort', '🏠', 'bg-blue-100 dark:bg-blue-900/30 text-blue-800 dark:text-blue-200', 'Other', 4)
) AS c(name, slug, icon, color, group_name, "order")
JOIN groups g ON g.name = c.group_name;