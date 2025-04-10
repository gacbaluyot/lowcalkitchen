/*
  # Add user roles and admin access control

  1. Changes
    - Add user_roles enum type
    - Add role column to auth.users
    - Add admin role check function
    
  2. Security
    - Only allow admin users to access admin features
*/

-- Create user_role type
CREATE TYPE user_role AS ENUM ('user', 'admin');

-- Add role column to auth.users
ALTER TABLE auth.users ADD COLUMN IF NOT EXISTS role user_role DEFAULT 'user'::user_role;

-- Create admin check function
CREATE OR REPLACE FUNCTION is_admin() 
RETURNS BOOLEAN AS $$
BEGIN
  RETURN (
    auth.role() = 'authenticated' AND 
    EXISTS (
      SELECT 1 FROM auth.users 
      WHERE id = auth.uid() 
      AND role = 'admin'::user_role
    )
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Set initial admin user
UPDATE auth.users
SET role = 'admin'
WHERE email = 'admin@lowcalrecipes.com';