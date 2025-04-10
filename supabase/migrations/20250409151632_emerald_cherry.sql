/*
  # Add low-calorie Filipino recipes

  1. Changes
    - Add traditional Filipino recipes modified to be lower in calories
    - Maintain authentic flavors while reducing fat and calories
    - Include protein-rich options
    
  2. Security
    - Uses existing RLS policies
*/

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug) VALUES
(
  'Skinny Chicken Adobo',
  'A lighter version of the classic Filipino adobo using chicken breast and less oil while maintaining the signature tangy, savory flavor',
  'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0',
  45,
  4,
  ARRAY[
    '4 chicken breasts (6 oz each)',
    '1/2 cup white vinegar',
    '1/4 cup low sodium soy sauce',
    '1 head garlic, minced',
    '2 bay leaves',
    '1 teaspoon whole black peppercorns',
    '1 tablespoon olive oil',
    '1 cup water',
    'Green onions for garnish'
  ],
  ARRAY[
    'In a bowl, combine vinegar, soy sauce, garlic, bay leaves, and peppercorns',
    'Add chicken and marinate for 30 minutes',
    'Heat olive oil in a large pan over medium heat',
    'Remove chicken from marinade (reserve marinade) and brown on both sides',
    'Pour in reserved marinade and water',
    'Bring to a boil, then reduce heat and simmer for 20-25 minutes',
    'Remove bay leaves before serving',
    'Garnish with green onions and serve with cauliflower rice'
  ],
  ARRAY['filipino', 'dinner', 'healthy'],
  NOW(),
  280,
  35,
  8,
  12,
  'skinny-chicken-adobo'
),
(
  'Lean Pork Sinigang',
  'A light and tangy Filipino soup made with lean pork tenderloin and plenty of vegetables',
  'https://images.unsplash.com/photo-1583835746434-cf1534674b41',
  50,
  6,
  ARRAY[
    '1 lb pork tenderloin, trimmed and cubed',
    '2 tomatoes, quartered',
    '1 onion, sliced',
    '2 cups spinach',
    '1 daikon radish, sliced',
    '2 eggplants, cubed',
    '4 pieces okra',
    '2 tablespoons sinigang mix',
    '8 cups water',
    'Fish sauce to taste'
  ],
  ARRAY[
    'Bring water to a boil in a large pot',
    'Add onions and tomatoes, simmer for 5 minutes',
    'Add pork and cook until tender (about 20 minutes)',
    'Add daikon and eggplant, cook for 5 minutes',
    'Add sinigang mix and okra',
    'Season with fish sauce to taste',
    'Add spinach last and cook until just wilted',
    'Serve hot with brown rice or cauliflower rice'
  ],
  ARRAY['filipino', 'soup', 'healthy'],
  NOW(),
  250,
  28,
  15,
  10,
  'lean-pork-sinigang'
),
(
  'Cauliflower Arroz Caldo',
  'A low-carb version of the Filipino rice porridge using cauliflower rice and chicken breast',
  'https://images.unsplash.com/photo-1590301157890-4810ed352733',
  40,
  4,
  ARRAY[
    '2 chicken breasts, diced',
    '1 large cauliflower, riced',
    '2 tablespoons ginger, minced',
    '4 cloves garlic, minced',
    '1 onion, diced',
    '4 cups chicken broth',
    '2 tablespoons fish sauce',
    '1/4 teaspoon saffron or turmeric powder',
    'Green onions for garnish',
    'Calamansi or lemon wedges for serving'
  ],
  ARRAY[
    'Sauté garlic, ginger, and onion in a pot',
    'Add chicken and cook until lightly browned',
    'Pour in chicken broth and fish sauce',
    'Add saffron or turmeric powder',
    'Simmer until chicken is cooked through',
    'Add cauliflower rice and cook for 5-7 minutes',
    'Garnish with green onions',
    'Serve with calamansi or lemon wedges'
  ],
  ARRAY['filipino', 'soup', 'healthy', 'low-carb'],
  NOW(),
  220,
  26,
  12,
  8,
  'cauliflower-arroz-caldo'
),
(
  'Ginisang Munggo with Turkey',
  'A protein-rich version of Filipino mung bean stew using turkey instead of pork',
  'https://images.unsplash.com/photo-1612929633738-8fe44f7ec841',
  35,
  4,
  ARRAY[
    '1 cup mung beans, soaked overnight',
    '1/2 lb ground turkey',
    '4 cups spinach',
    '1 onion, diced',
    '4 cloves garlic, minced',
    '2 tablespoons fish sauce',
    '4 cups water',
    'Black pepper to taste'
  ],
  ARRAY[
    'Cook mung beans in water until tender (about 20 minutes)',
    'In a separate pan, sauté garlic and onion',
    'Add ground turkey and cook until browned',
    'Add fish sauce and black pepper',
    'Combine with cooked mung beans',
    'Add spinach and cook until wilted',
    'Adjust seasoning to taste',
    'Serve hot'
  ],
  ARRAY['filipino', 'healthy', 'high-protein'],
  NOW(),
  290,
  24,
  32,
  6,
  'ginisang-munggo-with-turkey'
),
(
  'Tofu Sisig',
  'A vegetarian and low-calorie version of the popular Filipino sisig using tofu',
  'https://images.unsplash.com/photo-1546069901-d5bfd2cbfb1f',
  30,
  4,
  ARRAY[
    '2 blocks firm tofu, crumbled',
    '1 onion, finely diced',
    '2 chili peppers, chopped',
    '4 cloves garlic, minced',
    '2 tablespoons low sodium soy sauce',
    '2 tablespoons calamansi or lime juice',
    '1 tablespoon olive oil',
    'Black pepper to taste',
    'Green onions for garnish'
  ],
  ARRAY[
    'Press tofu to remove excess water',
    'Crumble tofu and bake at 400°F for 20 minutes until crispy',
    'Sauté garlic, onion, and chili peppers',
    'Add crispy tofu, soy sauce, and calamansi juice',
    'Season with black pepper',
    'Cook until well combined and heated through',
    'Garnish with green onions',
    'Serve with lettuce cups or cauliflower rice'
  ],
  ARRAY['filipino', 'vegetarian', 'healthy'],
  NOW(),
  180,
  16,
  12,
  10,
  'tofu-sisig'
);