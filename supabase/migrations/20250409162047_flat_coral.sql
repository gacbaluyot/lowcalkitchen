/*
  # Add Low Calorie Recipe Collection

  1. Changes
    - Add new low-calorie recipes for different categories:
      - Chicken (breast and thigh)
      - Beef
      - Fish
      - Desserts
      - Overnight oats
      - Yogurt-based dishes
    
  2. Security
    - Uses existing RLS policies
*/

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
-- Chicken Breast Recipes
(
  'Lemon Herb Grilled Chicken Breast',
  'Juicy, low-calorie grilled chicken breast seasoned with fresh herbs and lemon',
  'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d',
  25,
  4,
  ARRAY[
    '4 chicken breasts (6 oz each)',
    '2 lemons',
    '3 cloves garlic, minced',
    '2 tablespoons fresh herbs (rosemary, thyme, oregano)',
    '1 tablespoon olive oil',
    '1 teaspoon salt',
    '1/2 teaspoon black pepper'
  ],
  ARRAY[
    'Mix olive oil, lemon juice, garlic, and herbs',
    'Season chicken with salt and pepper',
    'Marinate chicken for 30 minutes',
    'Preheat grill to medium-high',
    'Grill chicken for 6-7 minutes per side',
    'Let rest for 5 minutes before serving'
  ],
  ARRAY['chicken', 'dinner', 'lunch', 'healthy'],
  NOW(),
  165,
  28,
  2,
  6,
  'lemon-herb-grilled-chicken-breast'
),
(
  'Asian-Style Chicken Thighs',
  'Flavorful low-calorie chicken thighs with Asian-inspired marinade',
  'https://images.unsplash.com/photo-1562967916-eb82221dfb92',
  35,
  4,
  ARRAY[
    '8 chicken thighs, skin removed',
    '3 tablespoons low-sodium soy sauce',
    '2 tablespoons rice vinegar',
    '1 tablespoon honey',
    '2 cloves garlic, minced',
    '1 tablespoon ginger, grated',
    '1 green onion, chopped',
    '1/2 teaspoon sesame oil'
  ],
  ARRAY[
    'Combine soy sauce, vinegar, honey, garlic, and ginger',
    'Marinate chicken for 2 hours',
    'Preheat oven to 375°F',
    'Bake for 25-30 minutes',
    'Brush with remaining marinade',
    'Garnish with green onions'
  ],
  ARRAY['chicken', 'dinner', 'healthy'],
  NOW(),
  180,
  24,
  8,
  7,
  'asian-style-chicken-thighs'
),

-- Beef Recipes
(
  'Lean Beef Stir-Fry',
  'Quick and healthy beef stir-fry with plenty of vegetables',
  'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
  20,
  4,
  ARRAY[
    '1 lb lean beef sirloin, sliced thin',
    '2 cups broccoli florets',
    '1 red bell pepper, sliced',
    '1 carrot, julienned',
    '2 tablespoons low-sodium soy sauce',
    '1 tablespoon cornstarch',
    '2 cloves garlic, minced',
    '1 tablespoon ginger, grated',
    '1 tablespoon olive oil'
  ],
  ARRAY[
    'Mix soy sauce, cornstarch, and 1/4 cup water',
    'Stir-fry beef in batches until browned',
    'Remove beef and cook vegetables',
    'Add garlic and ginger',
    'Return beef to pan with sauce',
    'Cook until sauce thickens'
  ],
  ARRAY['beef', 'dinner', 'healthy'],
  NOW(),
  250,
  26,
  12,
  10,
  'lean-beef-stir-fry'
),

-- Fish Recipes
(
  'Herb-Crusted Baked Cod',
  'Light and flaky cod fillets with a crispy herb crust',
  'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2',
  25,
  4,
  ARRAY[
    '4 cod fillets (6 oz each)',
    '1/2 cup whole wheat breadcrumbs',
    '2 tablespoons fresh parsley, chopped',
    '1 lemon, zested and juiced',
    '1 tablespoon olive oil',
    '1 teaspoon garlic powder',
    'Salt and pepper to taste'
  ],
  ARRAY[
    'Preheat oven to 400°F',
    'Mix breadcrumbs with herbs and lemon zest',
    'Season fish with salt and pepper',
    'Top with breadcrumb mixture',
    'Bake for 12-15 minutes',
    'Serve with lemon wedges'
  ],
  ARRAY['fish', 'dinner', 'healthy'],
  NOW(),
  180,
  24,
  10,
  5,
  'herb-crusted-baked-cod'
),

-- Overnight Oats
(
  'Mixed Berry Protein Overnight Oats',
  'Protein-rich overnight oats with fresh berries and Greek yogurt',
  'https://images.unsplash.com/photo-1583084335536-d4c1c7c5f27c',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1/2 cup Greek yogurt',
    '1/2 cup almond milk',
    '1 scoop vanilla protein powder',
    '1/2 cup mixed berries',
    '1 tablespoon chia seeds',
    '1 teaspoon honey',
    '1/4 teaspoon vanilla extract'
  ],
  ARRAY[
    'Mix oats, yogurt, milk, and protein powder',
    'Add chia seeds and vanilla',
    'Stir in honey',
    'Cover and refrigerate overnight',
    'Top with fresh berries before serving'
  ],
  ARRAY['breakfast', 'healthy', 'meal prep'],
  NOW(),
  290,
  24,
  32,
  8,
  'mixed-berry-protein-overnight-oats'
),

-- Yogurt-Based
(
  'Greek Yogurt Parfait',
  'Layered Greek yogurt parfait with homemade granola and fresh fruit',
  'https://images.unsplash.com/photo-1488477181946-6428a0291777',
  15,
  2,
  ARRAY[
    '2 cups Greek yogurt',
    '1 cup mixed berries',
    '1/2 cup low-fat granola',
    '2 tablespoons honey',
    '1/4 cup sliced almonds',
    '1 teaspoon vanilla extract'
  ],
  ARRAY[
    'Mix yogurt with vanilla extract',
    'Layer yogurt, berries, and granola',
    'Drizzle with honey',
    'Top with sliced almonds',
    'Serve immediately or chill'
  ],
  ARRAY['breakfast', 'snack', 'healthy'],
  NOW(),
  220,
  18,
  25,
  6,
  'greek-yogurt-parfait'
),

-- Healthy Dessert
(
  'Chocolate Protein Mousse',
  'Rich and creamy chocolate mousse made with Greek yogurt and protein powder',
  'https://images.unsplash.com/photo-1541658016709-82535e94bc69',
  15,
  4,
  ARRAY[
    '2 cups Greek yogurt',
    '2 scoops chocolate protein powder',
    '2 tablespoons cocoa powder',
    '2 tablespoons honey',
    '1 teaspoon vanilla extract',
    'Fresh berries for topping'
  ],
  ARRAY[
    'Mix yogurt with protein powder and cocoa',
    'Add honey and vanilla extract',
    'Whisk until smooth and creamy',
    'Chill for at least 1 hour',
    'Top with fresh berries before serving'
  ],
  ARRAY['dessert', 'healthy', 'high-protein'],
  NOW(),
  150,
  15,
  12,
  4,
  'chocolate-protein-mousse'
);