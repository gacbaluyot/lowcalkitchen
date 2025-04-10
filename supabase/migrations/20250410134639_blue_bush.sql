/*
  # Add initial recipes

  1. Changes
    - Add sample recipes to the recipes table
    - Ensure proper tags and categorization
*/

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
(
  'High Protein Chicken Bowl',
  'A nutritious and protein-packed bowl with grilled chicken breast, quinoa, and roasted vegetables',
  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
  30,
  4,
  ARRAY[
    '4 chicken breasts (6 oz each)',
    '1 cup quinoa',
    '2 cups broccoli florets',
    '2 bell peppers, sliced',
    '1 red onion, sliced',
    '2 tablespoons olive oil',
    '1 lemon',
    'Salt and pepper to taste',
    '2 tablespoons fresh herbs (parsley, basil)'
  ],
  ARRAY[
    'Cook quinoa according to package instructions',
    'Season chicken with salt, pepper, and 1 tablespoon olive oil',
    'Grill chicken for 6-7 minutes per side',
    'Roast vegetables with remaining oil at 400°F for 20 minutes',
    'Slice chicken and assemble bowls',
    'Garnish with fresh herbs and lemon'
  ],
  ARRAY['chicken', 'high-protein', 'healthy', 'meal-prep'],
  NOW(),
  425,
  38,
  45,
  14,
  'high-protein-chicken-bowl'
),
(
  'Low-Carb Salmon with Asparagus',
  'Pan-seared salmon fillet with roasted asparagus and lemon butter sauce',
  'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
  25,
  2,
  ARRAY[
    '2 salmon fillets (6 oz each)',
    '1 bunch asparagus',
    '2 tablespoons butter',
    '1 lemon',
    '2 cloves garlic, minced',
    'Fresh dill',
    'Salt and pepper to taste'
  ],
  ARRAY[
    'Season salmon with salt and pepper',
    'Pan-sear salmon skin-side up for 4 minutes',
    'Flip and cook for another 3-4 minutes',
    'Remove salmon and cook asparagus in the same pan',
    'Add butter, garlic, and lemon juice',
    'Return salmon to pan and garnish with dill'
  ],
  ARRAY['fish', 'salmon', 'low-carb', 'quick'],
  NOW(),
  380,
  34,
  8,
  22,
  'low-carb-salmon-asparagus'
),
(
  'Protein Overnight Oats',
  'High-protein overnight oats with Greek yogurt and mixed berries',
  'https://images.unsplash.com/photo-1583084335536-d4c1c7c5f27c',
  10,
  1,
  ARRAY[
    '1/2 cup rolled oats',
    '1 scoop vanilla protein powder',
    '1/2 cup Greek yogurt',
    '1/2 cup almond milk',
    '1 tablespoon chia seeds',
    '1/2 cup mixed berries',
    '1 tablespoon honey',
    '1/4 teaspoon vanilla extract'
  ],
  ARRAY[
    'Mix oats, protein powder, and chia seeds',
    'Add yogurt, milk, and vanilla',
    'Stir in honey',
    'Cover and refrigerate overnight',
    'Top with fresh berries before serving'
  ],
  ARRAY['breakfast', 'high-protein', 'meal-prep'],
  NOW(),
  320,
  28,
  42,
  8,
  'protein-overnight-oats'
),
(
  'Turkey Taco Bowl',
  'Low-fat turkey taco bowl with cauliflower rice and fresh vegetables',
  'https://images.unsplash.com/photo-1513442542250-854d436a73f2',
  25,
  4,
  ARRAY[
    '1 lb lean ground turkey',
    '4 cups cauliflower rice',
    '1 can black beans, drained',
    '2 bell peppers, diced',
    '1 onion, diced',
    'Taco seasoning',
    'Fresh cilantro',
    'Lime wedges'
  ],
  ARRAY[
    'Brown turkey with taco seasoning',
    'Cook cauliflower rice until tender',
    'Heat black beans',
    'Prepare fresh vegetables',
    'Assemble bowls',
    'Garnish with cilantro and lime'
  ],
  ARRAY['turkey', 'low-carb', 'meal-prep', 'mexican'],
  NOW(),
  350,
  32,
  15,
  18,
  'turkey-taco-bowl'
),
(
  'Greek Chicken Salad',
  'Fresh and healthy Greek salad with grilled chicken breast',
  'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af',
  20,
  2,
  ARRAY[
    '2 chicken breasts',
    'Mixed salad greens',
    'Cherry tomatoes',
    'Cucumber',
    'Red onion',
    'Kalamata olives',
    'Feta cheese',
    'Greek dressing'
  ],
  ARRAY[
    'Grill seasoned chicken breasts',
    'Chop vegetables',
    'Assemble salad',
    'Top with feta cheese',
    'Drizzle with dressing',
    'Serve immediately'
  ],
  ARRAY['chicken', 'salad', 'healthy', 'greek'],
  NOW(),
  320,
  35,
  12,
  16,
  'greek-chicken-salad'
);