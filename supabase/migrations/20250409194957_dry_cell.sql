/*
  # Add subscribers table

  1. New Tables
    - `subscribers`
      - `id` (uuid, primary key)
      - `email` (text, unique)
      - `created_at` (timestamp)
      - `status` (text) - For subscription status (active, unsubscribed)
      - `preferences` (text[]) - For newsletter preferences

  2. Security
    - Enable RLS on `subscribers` table
    - Add policy for public insert access
    - Add policy for service role access
*/

CREATE TABLE IF NOT EXISTS subscribers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  created_at timestamptz DEFAULT now(),
  status text DEFAULT 'active',
  preferences text[] DEFAULT '{}'
);

ALTER TABLE subscribers ENABLE ROW LEVEL SECURITY;

-- Allow public to subscribe
CREATE POLICY "Allow public to subscribe"
  ON subscribers
  FOR INSERT
  TO public
  WITH CHECK (true);

-- Allow service role full access
CREATE POLICY "Allow service role full access"
  ON subscribers
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);