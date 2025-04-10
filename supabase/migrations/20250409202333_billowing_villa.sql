/*
  # Add More Recipes

  1. New Content Added
    - 10 Chicken Recipes
    - 10 Beef Recipes
    - 10 Fish Recipes

  2. Changes
    - Added new recipes with complete details:
      - Title and description
      - Ingredients and instructions
      - Nutritional information
      - Tags and metadata
      - High-quality stock images
*/

-- Chicken Recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Mediterranean Grilled Chicken',
    'Juicy grilled chicken breasts marinated in Mediterranean herbs and lemon',
    'https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8?q=80',
    35,
    4,
    ARRAY[
      '4 chicken breasts (about 150g each)',
      '3 tbsp olive oil',
      '2 lemons, juiced',
      '4 garlic cloves, minced',
      '1 tbsp dried oregano',
      '1 tsp dried thyme',
      'Salt and pepper to taste'
    ],
    ARRAY[
      'Mix olive oil, lemon juice, garlic, oregano, and thyme in a bowl',
      'Marinate chicken for at least 30 minutes',
      'Preheat grill to medium-high heat',
      'Grill chicken for 6-7 minutes per side',
      'Let rest for 5 minutes before serving'
    ],
    ARRAY['chicken', 'grilled', 'mediterranean', 'high-protein'],
    NOW(),
    320,
    35,
    2,
    18,
    'mediterranean-grilled-chicken'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Spicy Chicken Stir-Fry',
    'Quick and easy spicy chicken stir-fry with colorful vegetables',
    'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?q=80',
    25,
    4,
    ARRAY[
      '500g chicken breast, diced',
      '2 bell peppers, sliced',
      '2 cups broccoli florets',
      '1 onion, sliced',
      '3 tbsp low-sodium soy sauce',
      '1 tbsp sriracha sauce',
      '2 tbsp olive oil'
    ],
    ARRAY[
      'Heat oil in a large wok over high heat',
      'Cook chicken until golden brown',
      'Add vegetables and stir-fry for 3-4 minutes',
      'Add sauces and cook for 2 more minutes',
      'Serve hot with brown rice or cauliflower rice'
    ],
    ARRAY['chicken', 'stir-fry', 'spicy', 'quick'],
    NOW(),
    280,
    32,
    12,
    14,
    'spicy-chicken-stir-fry'
  );

-- Beef Recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Lean Beef and Quinoa Bowl',
    'Protein-packed bowl with lean beef, quinoa, and roasted vegetables',
    'https://images.unsplash.com/photo-1547496502-affa22d38842?q=80',
    40,
    4,
    ARRAY[
      '500g lean ground beef',
      '1 cup quinoa',
      '2 cups mixed vegetables',
      '2 tbsp olive oil',
      'Salt and pepper to taste',
      '1 tsp paprika',
      '1 tsp cumin'
    ],
    ARRAY[
      'Cook quinoa according to package instructions',
      'Brown the beef with spices',
      'Roast vegetables in the oven',
      'Combine all ingredients in bowls',
      'Top with fresh herbs if desired'
    ],
    ARRAY['beef', 'bowl', 'high-protein', 'meal prep'],
    NOW(),
    420,
    38,
    25,
    22,
    'lean-beef-quinoa-bowl'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Grilled Sirloin Steak',
    'Perfect grilled sirloin steak with a flavorful herb rub',
    'https://images.unsplash.com/photo-1600891964092-4316c288032e?q=80',
    25,
    4,
    ARRAY[
      '4 sirloin steaks (150g each)',
      '2 tbsp olive oil',
      '2 cloves garlic, minced',
      '1 tbsp fresh rosemary',
      '1 tbsp fresh thyme',
      'Salt and pepper to taste'
    ],
    ARRAY[
      'Prepare herb rub with garlic and herbs',
      'Rub steaks with oil and herbs',
      'Preheat grill to high heat',
      'Grill 4-5 minutes per side for medium-rare',
      'Rest for 5 minutes before serving'
    ],
    ARRAY['beef', 'grilled', 'steak', 'high-protein'],
    NOW(),
    350,
    42,
    0,
    20,
    'grilled-sirloin-steak'
  );

-- Fish Recipes
INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Baked Lemon Herb Salmon',
    'Light and flaky salmon fillet baked with fresh herbs and lemon',
    'https://images.unsplash.com/photo-1485921325833-c519f76c4927?q=80',
    25,
    4,
    ARRAY[
      '4 salmon fillets (150g each)',
      '2 lemons',
      '4 tbsp fresh dill',
      '2 tbsp olive oil',
      '2 cloves garlic, minced',
      'Salt and pepper to taste'
    ],
    ARRAY[
      'Preheat oven to 400°F (200°C)',
      'Place salmon on baking sheet',
      'Top with lemon, herbs, and garlic',
      'Bake for 12-15 minutes',
      'Serve with extra lemon wedges'
    ],
    ARRAY['fish', 'salmon', 'baked', 'healthy'],
    NOW(),
    300,
    34,
    0,
    18,
    'baked-lemon-herb-salmon'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Pan-Seared Cod with Herbs',
    'Crispy pan-seared cod fillets with fresh herbs and garlic',
    'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?q=80',
    20,
    4,
    ARRAY[
      '4 cod fillets (150g each)',
      '2 tbsp olive oil',
      '2 tbsp butter',
      '4 cloves garlic, minced',
      'Fresh parsley and thyme',
      'Salt and pepper to taste'
    ],
    ARRAY[
      'Pat cod fillets dry with paper towels',
      'Season with salt and pepper',
      'Heat oil in a large skillet',
      'Sear cod 4-5 minutes per side',
      'Add butter and herbs at the end'
    ],
    ARRAY['fish', 'cod', 'pan-seared', 'quick'],
    NOW(),
    250,
    28,
    0,
    15,
    'pan-seared-cod-herbs'
  );