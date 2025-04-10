/*
  # Add more protein-rich overnight oat recipes

  1. Changes
    - Add banana-based overnight oat recipes
    - Add additional high-protein variations
    
  2. Security
    - Uses existing RLS policies
*/

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
(
  'Banana Protein Overnight Oats',
  'Creamy banana overnight oats packed with protein and healthy fats, perfect for a filling breakfast or post-workout meal',
  'https://images.unsplash.com/photo-1624813743954-d32f24df6c6b',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop vanilla protein powder',
    '1 ripe banana, mashed',
    '1 cup unsweetened almond milk',
    '1 tablespoon chia seeds',
    '2 tablespoons Greek yogurt',
    '1 tablespoon honey',
    '1/4 teaspoon cinnamon',
    '1 tablespoon almond butter',
    'Extra banana slices for topping'
  ],
  ARRAY[
    'Mash banana in a jar or container',
    'Add oats, protein powder, and chia seeds',
    'Pour in almond milk and add Greek yogurt',
    'Add honey and cinnamon, stir well',
    'Cover and refrigerate overnight',
    'In the morning, top with almond butter and banana slices',
    'Optional: add a sprinkle of cinnamon'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  390,
  28,
  46,
  14,
  'banana-protein-overnight-oats'
),
(
  'Triple Berry Protein Overnight Oats',
  'High-protein overnight oats loaded with three types of berries and Greek yogurt for extra protein boost',
  'https://images.unsplash.com/photo-1557749823-c1c8a66c0f92',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop vanilla protein powder',
    '1/2 cup Greek yogurt',
    '3/4 cup unsweetened almond milk',
    '1 tablespoon chia seeds',
    '1/4 cup raspberries',
    '1/4 cup blueberries',
    '1/4 cup strawberries, sliced',
    '1 tablespoon honey',
    '1/4 teaspoon vanilla extract'
  ],
  ARRAY[
    'Mix oats, protein powder, and chia seeds in a jar',
    'Add Greek yogurt, almond milk, and vanilla extract',
    'Stir in honey until well combined',
    'Fold in half of the berries',
    'Cover and refrigerate overnight',
    'Top with remaining berries before serving',
    'Optional: drizzle with additional honey'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  375,
  32,
  43,
  10,
  'triple-berry-protein-overnight-oats'
),
(
  'Mocha Protein Overnight Oats',
  'Coffee-infused overnight oats with a double protein boost from both protein powder and cottage cheese',
  'https://images.unsplash.com/photo-1620921575116-fb8902865f81',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop chocolate protein powder',
    '1/2 cup cottage cheese',
    '3/4 cup cold brew coffee',
    '1/4 cup unsweetened almond milk',
    '1 tablespoon chia seeds',
    '1 tablespoon cocoa powder',
    '1 tablespoon maple syrup',
    '1/4 teaspoon vanilla extract',
    'Dark chocolate shavings for topping'
  ],
  ARRAY[
    'Mix oats, protein powder, cocoa powder, and chia seeds',
    'Add cottage cheese and stir to combine',
    'Pour in cold brew coffee and almond milk',
    'Add maple syrup and vanilla extract, mix well',
    'Cover and refrigerate overnight',
    'Stir before serving and top with chocolate shavings',
    'Optional: add a splash of milk if too thick'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  395,
  35,
  41,
  12,
  'mocha-protein-overnight-oats'
),
(
  'Banana Nutella Protein Overnight Oats',
  'Indulgent yet protein-rich overnight oats combining banana and hazelnut spread with a healthy twist',
  'https://images.unsplash.com/photo-1614961234274-f204d01c115e',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop chocolate protein powder',
    '1 ripe banana, mashed',
    '1 cup unsweetened almond milk',
    '1/2 cup Greek yogurt',
    '1 tablespoon chia seeds',
    '2 tablespoons sugar-free hazelnut spread',
    '1 tablespoon cocoa powder',
    '1/4 teaspoon vanilla extract',
    'Chopped hazelnuts for topping'
  ],
  ARRAY[
    'Mash banana in a jar',
    'Add oats, protein powder, cocoa powder, and chia seeds',
    'Mix in Greek yogurt and almond milk',
    'Swirl in 1 tablespoon hazelnut spread',
    'Cover and refrigerate overnight',
    'Top with remaining hazelnut spread and chopped hazelnuts',
    'Optional: add sliced banana on top'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  420,
  30,
  45,
  15,
  'banana-nutella-protein-overnight-oats'
),
(
  'Coconut Mango Protein Overnight Oats',
  'Tropical protein-packed overnight oats with fresh mango and coconut',
  'https://images.unsplash.com/photo-1623428187499-639d6c45e2b5',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop vanilla protein powder',
    '1 cup coconut milk',
    '1/4 cup Greek yogurt',
    '1 tablespoon chia seeds',
    '1 ripe mango, diced',
    '2 tablespoons unsweetened coconut flakes',
    '1 tablespoon honey',
    '1/4 teaspoon vanilla extract',
    'Extra coconut flakes for topping'
  ],
  ARRAY[
    'Combine oats, protein powder, and chia seeds in a jar',
    'Add coconut milk, Greek yogurt, and vanilla extract',
    'Stir in honey until well combined',
    'Add half the diced mango and coconut flakes',
    'Cover and refrigerate overnight',
    'Top with remaining mango and coconut flakes',
    'Optional: drizzle with additional honey'
  ],
  ARRAY['breakfast', 'meal prep', 'healthy'],
  NOW(),
  385,
  26,
  44,
  13,
  'coconut-mango-protein-overnight-oats'
);