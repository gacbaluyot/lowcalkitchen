/*
  # Add user favorites and admin access

  1. New Tables
    - `user_favorites`
      - `id` (uuid, primary key)
      - `user_id` (uuid, references auth.users)
      - `recipe_id` (uuid, references recipes)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS
    - Add policies for:
      - Users can manage their own favorites
      - Admin users have full access
*/

-- Create user favorites table
CREATE TABLE user_favorites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  recipe_id uuid REFERENCES recipes(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, recipe_id)
);

-- Enable RLS
ALTER TABLE user_favorites ENABLE ROW LEVEL SECURITY;

-- Allow users to manage their own favorites
CREATE POLICY "Users can manage their own favorites"
  ON user_favorites
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Allow admin full access to recipes
CREATE POLICY "Enable full access for admin users on recipes"
  ON recipes
  USING (
    auth.role() = 'authenticated' AND
    EXISTS (
      SELECT 1 FROM auth.users
      WHERE id = auth.uid()
      AND role = 'admin'
    )
  )
  WITH CHECK (
    auth.role() = 'authenticated' AND
    EXISTS (
      SELECT 1 FROM auth.users
      WHERE id = auth.uid()
      AND role = 'admin'
    )
  );

-- Create admin routes view for security
CREATE VIEW admin_routes AS
SELECT 
  id,
  email,
  role::text as role
FROM auth.users
WHERE role::text = 'admin';

-- Grant access to admin routes view
GRANT SELECT ON admin_routes TO authenticated;