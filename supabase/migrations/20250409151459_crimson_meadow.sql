/*
  # Add more diverse recipes

  1. Changes
    - Add high-protein dinner recipes
    - Add healthy lunch options
    - Add meal prep friendly recipes
    
  2. Security
    - Uses existing RLS policies
*/

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
(
  'Grilled Chicken Quinoa Bowl',
  'A protein-packed quinoa bowl with grilled chicken, roasted vegetables, and a light lemon herb dressing',
  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
  35,
  4,
  ARRAY[
    '4 chicken breasts (6 oz each)',
    '2 cups quinoa',
    '4 cups chicken broth',
    '2 bell peppers, sliced',
    '2 zucchini, sliced',
    '1 red onion, sliced',
    '3 tablespoons olive oil',
    '2 lemons, juiced',
    '2 tablespoons fresh herbs (parsley, basil)',
    'Salt and pepper to taste'
  ],
  ARRAY[
    'Cook quinoa in chicken broth according to package instructions',
    'Season chicken with salt, pepper, and 1 tablespoon olive oil',
    'Grill chicken for 6-7 minutes per side until cooked through',
    'Toss vegetables with olive oil, salt, and pepper',
    'Roast vegetables at 400°F for 20-25 minutes',
    'Make dressing with lemon juice, remaining olive oil, and herbs',
    'Slice chicken and assemble bowls with quinoa, vegetables, and dressing'
  ],
  ARRAY['dinner', 'meal prep', 'healthy'],
  NOW(),
  425,
  38,
  45,
  14,
  'grilled-chicken-quinoa-bowl'
),
(
  'Spicy Turkey Meatballs',
  'Lean turkey meatballs with a kick of spice, perfect for meal prep or a protein-rich dinner',
  'https://images.unsplash.com/photo-1529042410759-befb1204b468',
  40,
  6,
  ARRAY[
    '2 lbs ground turkey',
    '1 cup whole wheat breadcrumbs',
    '2 eggs',
    '4 cloves garlic, minced',
    '1 onion, finely diced',
    '2 tablespoons Italian seasoning',
    '1 teaspoon red pepper flakes',
    '1 teaspoon salt',
    '1/2 teaspoon black pepper',
    '2 tablespoons olive oil'
  ],
  ARRAY[
    'Combine ground turkey, breadcrumbs, eggs, garlic, onion, and seasonings',
    'Form mixture into 24 meatballs',
    'Heat olive oil in a large skillet over medium heat',
    'Cook meatballs for 4-5 minutes per side until browned',
    'Add 1 cup water, cover, and simmer for 10 minutes',
    'Check internal temperature reaches 165°F',
    'Serve hot or store for meal prep'
  ],
  ARRAY['dinner', 'meal prep', 'healthy'],
  NOW(),
  320,
  32,
  18,
  16,
  'spicy-turkey-meatballs'
),
(
  'Mediterranean Tuna Salad',
  'A protein-rich tuna salad with Mediterranean flavors, perfect for a light lunch',
  'https://images.unsplash.com/photo-1604909052743-94e838986d24',
  15,
  2,
  ARRAY[
    '2 cans solid white tuna in water, drained',
    '1/2 red onion, finely chopped',
    '1 cucumber, diced',
    '1 cup cherry tomatoes, halved',
    '1/2 cup Kalamata olives, pitted',
    '1/4 cup fresh parsley, chopped',
    '2 tablespoons olive oil',
    '1 lemon, juiced',
    '1 teaspoon dried oregano',
    'Salt and pepper to taste'
  ],
  ARRAY[
    'Drain tuna well and break into chunks',
    'Combine with chopped vegetables and olives',
    'Mix olive oil, lemon juice, and oregano for dressing',
    'Toss all ingredients together',
    'Season with salt and pepper',
    'Chill for 30 minutes before serving',
    'Serve over lettuce or with whole grain crackers'
  ],
  ARRAY['lunch', 'healthy'],
  NOW(),
  285,
  32,
  8,
  16,
  'mediterranean-tuna-salad'
),
(
  'Black Bean Sweet Potato Burgers',
  'Vegetarian protein-packed burgers with southwestern flavors',
  'https://images.unsplash.com/photo-1585238342024-78d387f4a707',
  45,
  6,
  ARRAY[
    '2 large sweet potatoes, roasted and mashed',
    '2 cans black beans, drained and rinsed',
    '1 cup quinoa, cooked',
    '1 red onion, finely diced',
    '4 cloves garlic, minced',
    '2 tablespoons ground cumin',
    '1 tablespoon chili powder',
    '1 cup oat flour',
    '2 eggs',
    'Salt and pepper to taste'
  ],
  ARRAY[
    'Mash black beans in a large bowl',
    'Mix in mashed sweet potatoes and cooked quinoa',
    'Add onion, garlic, and seasonings',
    'Stir in oat flour and eggs until well combined',
    'Form into 12 patties',
    'Refrigerate for 30 minutes',
    'Cook in skillet or bake at 375°F for 20-25 minutes'
  ],
  ARRAY['dinner', 'vegetarian', 'healthy'],
  NOW(),
  280,
  12,
  42,
  8,
  'black-bean-sweet-potato-burgers'
),
(
  'Asian Sesame Salmon Bowl',
  'Glazed salmon with brown rice and Asian-inspired vegetables',
  'https://images.unsplash.com/photo-1512132411229-c30391241dd8',
  30,
  4,
  ARRAY[
    '4 salmon fillets (6 oz each)',
    '2 cups brown rice',
    '4 cups mixed vegetables (broccoli, carrots, snap peas)',
    '1/4 cup soy sauce',
    '2 tablespoons sesame oil',
    '2 tablespoons honey',
    '2 tablespoons rice vinegar',
    '1 tablespoon ginger, grated',
    '2 cloves garlic, minced',
    'Sesame seeds for garnish'
  ],
  ARRAY[
    'Cook brown rice according to package instructions',
    'Mix soy sauce, sesame oil, honey, vinegar, ginger, and garlic',
    'Marinate salmon in half the sauce for 15 minutes',
    'Steam vegetables until crisp-tender',
    'Bake salmon at 400°F for 12-15 minutes',
    'Toss vegetables with remaining sauce',
    'Serve salmon over rice with vegetables and sesame seeds'
  ],
  ARRAY['dinner', 'healthy'],
  NOW(),
  420,
  34,
  38,
  18,
  'asian-sesame-salmon-bowl'
);