/*
  # Create recipes table and security policies

  1. New Tables
    - `recipes`
      - `id` (uuid, primary key)
      - `title` (text)
      - `description` (text)
      - `image` (text)
      - `cooking_time` (integer)
      - `servings` (integer)
      - `ingredients` (text array)
      - `instructions` (text array)
      - `tags` (text array)
      - `publish_date` (timestamp with time zone)
      - `calories` (integer)
      - `protein` (integer)
      - `carbs` (integer)
      - `fat` (integer)
      - `created_at` (timestamp with time zone)
      - `slug` (text)

  2. Security
    - Enable RLS on `recipes` table
    - Add policies for:
      - Public read access
      - Service role insert access
*/

CREATE TABLE recipes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text NOT NULL,
  image text,
  cooking_time integer NOT NULL,
  servings integer NOT NULL,
  ingredients text[] NOT NULL,
  instructions text[] NOT NULL,
  tags text[] NOT NULL,
  publish_date timestamptz NOT NULL,
  calories integer NOT NULL,
  protein integer NOT NULL,
  carbs integer NOT NULL,
  fat integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  slug text NOT NULL
);

-- Enable Row Level Security
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access"
  ON recipes
  FOR SELECT
  TO public
  USING (true);

-- Create policy for service role insert access
CREATE POLICY "Allow service role insert"
  ON recipes
  FOR INSERT
  TO service_role
  WITH CHECK (true);

-- Create policy for service role delete access
CREATE POLICY "Allow service role delete"
  ON recipes
  FOR DELETE
  TO service_role
  USING (true);

-- Insert existing recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
-- Baked Salmon
(
  'Lemon Herb Baked Salmon',
  'Tender and flaky salmon fillet baked with fresh herbs and lemon, perfect for a healthy protein-rich dinner',
  'https://images.unsplash.com/photo-1485921325833-c519f76c4927',
  20,
  4,
  ARRAY['4 salmon fillets (6 oz each)', '2 tablespoons olive oil', '2 lemons', '4 cloves garlic, minced', '2 tablespoons fresh dill, chopped', '1 tablespoon fresh parsley, chopped', '1 teaspoon sea salt', '1/2 teaspoon black pepper'],
  ARRAY['Preheat oven to 400°F (200°C)', 'Place salmon on a baking sheet lined with parchment paper', 'Drizzle with olive oil and season with salt and pepper', 'Top with minced garlic, herbs, and lemon slices', 'Bake for 12-15 minutes until salmon flakes easily', 'Garnish with fresh herbs and serve with lemon wedges'],
  ARRAY['dinner'],
  '2024-02-27',
  320,
  34,
  2,
  20,
  'lemon-herb-baked-salmon'
);