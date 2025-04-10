/*
  # Add marinade and overnight oat recipes

  1. Changes
    - Add new marinade recipes
    - Add new overnight oat recipes
    
  2. Security
    - Uses existing RLS policies
*/

-- Insert new marinade recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
(
  'Asian Honey Garlic Marinade',
  'A sweet and savory marinade perfect for chicken, pork, or tofu, with a perfect balance of honey, soy sauce, and garlic',
  'https://images.unsplash.com/photo-1603360946369-dc9bb6258143',
  45,
  4,
  ARRAY[
    '1/2 cup soy sauce',
    '1/4 cup honey',
    '4 cloves garlic, minced',
    '1 tablespoon ginger, grated',
    '2 tablespoons rice vinegar',
    '1 tablespoon sesame oil',
    '1/4 teaspoon black pepper',
    '2 green onions, chopped',
    '4 chicken breasts or pork chops'
  ],
  ARRAY[
    'Combine all marinade ingredients in a bowl',
    'Reserve 1/4 cup marinade for basting',
    'Place meat in a zip-top bag with remaining marinade',
    'Marinate in refrigerator for 2-8 hours',
    'Preheat grill or pan to medium-high heat',
    'Cook meat, basting with reserved marinade',
    'Let rest for 5 minutes before serving',
    'Garnish with chopped green onions'
  ],
  ARRAY['marinade', 'dinner', 'meal prep'],
  NOW(),
  280,
  32,
  15,
  10,
  'asian-honey-garlic-marinade'
),
(
  'Citrus Herb Marinade',
  'Bright and fresh marinade combining citrus juices with fresh herbs, perfect for fish or chicken',
  'https://images.unsplash.com/photo-1599021456807-9c7c7866d92d',
  40,
  4,
  ARRAY[
    '1/4 cup olive oil',
    '2 lemons, juiced',
    '1 orange, juiced and zested',
    '4 cloves garlic, minced',
    '2 tablespoons fresh rosemary, chopped',
    '2 tablespoons fresh thyme, chopped',
    '1 teaspoon sea salt',
    '1/2 teaspoon black pepper',
    '4 fish fillets or chicken breasts'
  ],
  ARRAY[
    'Whisk together all marinade ingredients',
    'Reserve 1/4 cup for serving',
    'Place protein in a shallow dish with marinade',
    'Marinate fish for 30 minutes or chicken for 2-4 hours',
    'Preheat grill or oven to 400°F',
    'Cook until done, basting occasionally',
    'Drizzle with reserved marinade',
    'Garnish with additional fresh herbs'
  ],
  ARRAY['marinade', 'dinner', 'healthy'],
  NOW(),
  250,
  28,
  8,
  12,
  'citrus-herb-marinade'
);

-- Insert overnight oat recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
(
  'Berry Protein Overnight Oats',
  'Protein-packed overnight oats with mixed berries and vanilla, perfect for a healthy breakfast',
  'https://images.unsplash.com/photo-1516714435131-44d6b64dc6a2',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop vanilla protein powder',
    '1 cup almond milk',
    '1 tablespoon chia seeds',
    '1/2 cup mixed berries',
    '1 tablespoon honey',
    '1/4 teaspoon vanilla extract',
    '1 tablespoon almond butter'
  ],
  ARRAY[
    'In a jar, combine oats, protein powder, and chia seeds',
    'Add almond milk and vanilla extract, stir well',
    'Add honey and mix thoroughly',
    'Cover and refrigerate overnight (or at least 6 hours)',
    'In the morning, top with mixed berries and almond butter',
    'Stir and enjoy cold or warm'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  350,
  24,
  45,
  12,
  'berry-protein-overnight-oats'
),
(
  'Chocolate Peanut Butter Overnight Oats',
  'Decadent yet healthy overnight oats combining chocolate and peanut butter for a protein-rich breakfast',
  'https://images.unsplash.com/photo-1517673132405-a56a62b18caf',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop chocolate protein powder',
    '1 cup oat milk',
    '1 tablespoon chia seeds',
    '2 tablespoons peanut butter',
    '1 tablespoon cocoa powder',
    '1 tablespoon maple syrup',
    '1/4 teaspoon vanilla extract',
    'Banana slices for topping'
  ],
  ARRAY[
    'Mix oats, protein powder, cocoa powder, and chia seeds in a jar',
    'Add oat milk, maple syrup, and vanilla extract',
    'Stir in 1 tablespoon peanut butter',
    'Cover and refrigerate overnight',
    'Before serving, top with remaining peanut butter and banana slices',
    'Stir and enjoy'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  420,
  28,
  48,
  16,
  'chocolate-peanut-butter-overnight-oats'
),
(
  'Apple Cinnamon Protein Overnight Oats',
  'Cozy apple cinnamon overnight oats with added protein, perfect for fall mornings',
  'https://images.unsplash.com/photo-1623428187969-5da2dcea5ebf',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop vanilla protein powder',
    '1 cup unsweetened almond milk',
    '1 tablespoon chia seeds',
    '1 apple, diced',
    '1 teaspoon cinnamon',
    '1 tablespoon maple syrup',
    '2 tablespoons chopped walnuts',
    '1/4 teaspoon vanilla extract'
  ],
  ARRAY[
    'Combine oats, protein powder, cinnamon, and chia seeds in a jar',
    'Add almond milk, maple syrup, and vanilla extract',
    'Stir well to combine',
    'Add half the diced apple and mix',
    'Cover and refrigerate overnight',
    'Before serving, top with remaining apple and walnuts',
    'Optional: warm slightly in microwave'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  380,
  26,
  42,
  14,
  'apple-cinnamon-protein-overnight-oats'
);