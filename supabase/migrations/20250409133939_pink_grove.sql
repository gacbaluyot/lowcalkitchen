/*
  # Remigrate recipes table with updated schema and policies

  1. Changes
    - Drop existing table and recreate with updated schema
    - Add slug column
    - Update RLS policies for proper access control

  2. Security
    - Enable RLS
    - Add policies for:
      - Public read access
      - Service role insert access
      - Service role delete access
*/

-- Drop existing table if it exists
DROP TABLE IF EXISTS recipes;

-- Create new table with updated schema
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