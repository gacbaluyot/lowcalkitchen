/*
  # Add admin authentication and authorization

  1. Security
    - Create policy for admin access to recipes table
    - Only allow admin users to modify recipes
*/

-- Create policy for admin access
CREATE POLICY "Enable full access for admin users"
  ON recipes
  USING (
    auth.role() = 'authenticated' AND
    auth.email() IN (
      'admin@lowcalrecipes.com'  -- Add your admin email here
    )
  )
  WITH CHECK (
    auth.role() = 'authenticated' AND
    auth.email() IN (
      'admin@lowcalrecipes.com'  -- Add your admin email here
    )
  );