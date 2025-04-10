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

  2. Security
    - Enable RLS on `recipes` table
    - Add policies for public read access
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
  created_at timestamptz DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access"
  ON recipes
  FOR SELECT
  TO public
  USING (true);

-- Insert existing recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat) VALUES
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
  20
),
-- Chocolate Chip Cookies
(
  'Classic Chocolate Chip Cookies',
  'Soft and chewy chocolate chip cookies that are perfect for any occasion',
  'https://images.unsplash.com/photo-1499636136210-6f4ee915583e',
  25,
  24,
  ARRAY['2 1/4 cups all-purpose flour', '1 cup butter, softened', '3/4 cup granulated sugar', '3/4 cup packed brown sugar', '2 large eggs', '1 teaspoon vanilla extract', '1 teaspoon baking soda', '1/2 teaspoon salt', '2 cups semi-sweet chocolate chips'],
  ARRAY['Preheat oven to 375°F (190°C)', 'In a bowl, cream together butter, granulated sugar, and brown sugar', 'Beat in eggs one at a time, then stir in vanilla', 'Combine flour, baking soda, and salt; gradually blend into the butter mixture', 'Stir in chocolate chips', 'Drop by rounded tablespoons onto ungreased baking sheets', 'Bake for 9 to 11 minutes or until golden brown'],
  ARRAY['dessert'],
  '2024-02-20',
  180,
  2,
  24,
  9
),
-- Other recipes...
-- Add all other recipes similarly
(
  'Teriyaki Chicken Marinade',
  'Juicy chicken marinated in a homemade teriyaki sauce, perfect for meal prep',
  'https://images.unsplash.com/photo-1606756790138-261d2b21cd75',
  40,
  4,
  ARRAY['4 chicken breasts (6 oz each)', '1/2 cup soy sauce', '1/4 cup mirin', '1/4 cup sake or rice wine', '3 tablespoons brown sugar', '2 cloves garlic, minced', '1 tablespoon ginger, grated', '1 tablespoon cornstarch (for sauce)', '2 tablespoons water (for cornstarch slurry)'],
  ARRAY['Mix soy sauce, mirin, sake, brown sugar, garlic, and ginger in a bowl', 'Reserve 1/2 cup of marinade for sauce', 'Place chicken in a zip-top bag with remaining marinade', 'Refrigerate for 2-4 hours', 'Preheat grill or pan to medium-high heat', 'Grill chicken for 6-7 minutes per side', 'For sauce, mix cornstarch with water and add to reserved marinade', 'Simmer sauce until thickened', 'Brush chicken with sauce before serving'],
  ARRAY['dinner'],
  '2024-03-01',
  290,
  35,
  15,
  12
);