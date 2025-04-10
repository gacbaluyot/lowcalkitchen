/*
  # Add recipe ratings functionality

  1. New Tables
    - `recipe_ratings`
      - `id` (uuid, primary key)
      - `recipe_id` (uuid, foreign key)
      - `rating` (integer)
      - `comment` (text)
      - `user_email` (text)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS
    - Add policies for:
      - Public read access
      - Authenticated users can create ratings
*/

CREATE TABLE recipe_ratings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  recipe_id uuid REFERENCES recipes(id) ON DELETE CASCADE,
  rating integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment text,
  user_email text NOT NULL,
  created_at timestamptz DEFAULT now(),
  UNIQUE(recipe_id, user_email)
);

-- Enable RLS
ALTER TABLE recipe_ratings ENABLE ROW LEVEL SECURITY;

-- Allow public read access
CREATE POLICY "Allow public read access"
  ON recipe_ratings
  FOR SELECT
  TO public
  USING (true);

-- Allow authenticated users to create ratings
CREATE POLICY "Allow authenticated users to create ratings"
  ON recipe_ratings
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Allow users to update their own ratings
CREATE POLICY "Allow users to update their own ratings"
  ON recipe_ratings
  FOR UPDATE
  TO authenticated
  USING (auth.email() = user_email)
  WITH CHECK (auth.email() = user_email);

-- Allow users to delete their own ratings
CREATE POLICY "Allow users to delete their own ratings"
  ON recipe_ratings
  FOR DELETE
  TO authenticated
  USING (auth.email() = user_email);