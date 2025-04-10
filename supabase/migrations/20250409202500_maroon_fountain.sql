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

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Lemon Garlic Chicken Thighs',
    'Tender and juicy chicken thighs with a bright lemon garlic sauce',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?q=80',
    40,
    4,
    ARRAY[
      '8 chicken thighs',
      '4 cloves garlic, minced',
      '2 lemons',
      '2 tbsp olive oil',
      '1 tbsp fresh thyme',
      'Salt and pepper to taste'
    ],
    ARRAY[
      'Season chicken thighs with salt and pepper',
      'Heat oil in a large skillet over medium-high heat',
      'Cook chicken skin-side down until golden',
      'Flip and add garlic, lemon, and thyme',
      'Finish cooking until done'
    ],
    ARRAY['chicken', 'one-pan', 'easy', 'low-carb'],
    NOW(),
    350,
    28,
    2,
    24,
    'lemon-garlic-chicken-thighs'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Chicken Fajita Bowl',
    'Healthy and colorful chicken fajita bowl with cauliflower rice',
    'https://images.unsplash.com/photo-1600336153113-d66c79de3e91?q=80',
    30,
    4,
    ARRAY[
      '500g chicken breast, sliced',
      '2 bell peppers',
      '1 onion',
      '2 cups cauliflower rice',
      'Fajita seasoning',
      'Lime and cilantro'
    ],
    ARRAY[
      'Season chicken with fajita seasoning',
      'Cook chicken in a large skillet',
      'Sauté peppers and onions',
      'Prepare cauliflower rice',
      'Assemble bowls with toppings'
    ],
    ARRAY['chicken', 'mexican', 'low-carb', 'meal-prep'],
    NOW(),
    310,
    35,
    8,
    16,
    'chicken-fajita-bowl'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Buffalo Chicken Lettuce Wraps',
    'Spicy buffalo chicken served in crisp lettuce cups',
    'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?q=80',
    25,
    4,
    ARRAY[
      '500g ground chicken',
      'Buffalo sauce',
      'Lettuce leaves',
      'Celery, diced',
      'Blue cheese',
      'Ranch dressing'
    ],
    ARRAY[
      'Cook ground chicken until done',
      'Add buffalo sauce to taste',
      'Prepare lettuce cups',
      'Fill with chicken mixture',
      'Top with celery and dressing'
    ],
    ARRAY['chicken', 'low-carb', 'spicy', 'quick'],
    NOW(),
    280,
    32,
    4,
    16,
    'buffalo-chicken-lettuce-wraps'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Greek Chicken Skewers',
    'Marinated chicken skewers with Mediterranean flavors',
    'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80',
    35,
    4,
    ARRAY[
      '600g chicken breast, cubed',
      'Greek yogurt',
      'Lemon juice',
      'Garlic',
      'Oregano',
      'Olive oil'
    ],
    ARRAY[
      'Make marinade with yogurt and seasonings',
      'Marinate chicken for 2 hours',
      'Thread onto skewers',
      'Grill until cooked through',
      'Serve with tzatziki'
    ],
    ARRAY['chicken', 'greek', 'grilled', 'high-protein'],
    NOW(),
    290,
    38,
    6,
    12,
    'greek-chicken-skewers'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Chicken and Broccoli Stir-Fry',
    'Classic healthy stir-fry with lean chicken and broccoli',
    'https://images.unsplash.com/photo-1617093727343-374698b1c1d8?q=80',
    20,
    4,
    ARRAY[
      '500g chicken breast',
      'Broccoli florets',
      'Garlic',
      'Ginger',
      'Soy sauce',
      'Sesame oil'
    ],
    ARRAY[
      'Cut chicken into bite-sized pieces',
      'Stir-fry chicken until golden',
      'Add broccoli and aromatics',
      'Pour in sauce and simmer',
      'Serve hot'
    ],
    ARRAY['chicken', 'asian', 'quick', 'healthy'],
    NOW(),
    270,
    35,
    10,
    12,
    'chicken-broccoli-stir-fry'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Baked Chicken Parmesan',
    'Healthier baked version of the classic chicken parmesan',
    'https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8?q=80',
    45,
    4,
    ARRAY[
      '4 chicken breasts',
      'Almond flour',
      'Parmesan cheese',
      'Marinara sauce',
      'Mozzarella',
      'Italian herbs'
    ],
    ARRAY[
      'Coat chicken in almond flour mixture',
      'Bake until golden',
      'Top with sauce and cheese',
      'Broil until cheese melts',
      'Serve with zucchini noodles'
    ],
    ARRAY['chicken', 'italian', 'low-carb', 'baked'],
    NOW(),
    340,
    42,
    8,
    16,
    'baked-chicken-parmesan'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Thai Basil Chicken',
    'Spicy Thai-style chicken with fresh basil',
    'https://images.unsplash.com/photo-1627308595229-7830a5c91f9f?q=80',
    25,
    4,
    ARRAY[
      'Ground chicken',
      'Thai basil',
      'Garlic',
      'Chili',
      'Fish sauce',
      'Soy sauce'
    ],
    ARRAY[
      'Stir-fry garlic and chili',
      'Add ground chicken',
      'Season with sauces',
      'Mix in fresh basil',
      'Serve with cauliflower rice'
    ],
    ARRAY['chicken', 'thai', 'spicy', 'quick'],
    NOW(),
    290,
    32,
    6,
    15,
    'thai-basil-chicken'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Chicken Caesar Salad',
    'Classic Caesar salad with grilled chicken breast',
    'https://images.unsplash.com/photo-1599021456807-4962a115b345?q=80',
    20,
    4,
    ARRAY[
      'Chicken breast',
      'Romaine lettuce',
      'Parmesan cheese',
      'Light Caesar dressing',
      'Cherry tomatoes',
      'Croutons optional'
    ],
    ARRAY[
      'Grill chicken breast',
      'Chop lettuce and tomatoes',
      'Slice chicken',
      'Toss with dressing',
      'Top with parmesan'
    ],
    ARRAY['chicken', 'salad', 'quick', 'light'],
    NOW(),
    320,
    35,
    5,
    18,
    'chicken-caesar-salad'
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

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Korean Beef Bowl',
    'Quick and flavorful Korean-style beef over cauliflower rice',
    'https://images.unsplash.com/photo-1633237308525-cd302ca3fb2d?q=80',
    25,
    4,
    ARRAY[
      '500g ground beef',
      'Soy sauce',
      'Sesame oil',
      'Brown sugar substitute',
      'Garlic',
      'Ginger'
    ],
    ARRAY[
      'Brown the beef',
      'Add sauce ingredients',
      'Simmer until thickened',
      'Serve over cauliflower rice',
      'Garnish with green onions'
    ],
    ARRAY['beef', 'asian', 'quick', 'low-carb'],
    NOW(),
    380,
    35,
    8,
    24,
    'korean-beef-bowl'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Beef and Broccoli',
    'Classic Chinese-style beef and broccoli stir-fry',
    'https://images.unsplash.com/photo-1617093727343-374698b1c1d8?q=80',
    30,
    4,
    ARRAY[
      'Beef strips',
      'Broccoli florets',
      'Garlic',
      'Ginger',
      'Soy sauce',
      'Oyster sauce'
    ],
    ARRAY[
      'Marinate beef strips',
      'Stir-fry beef until browned',
      'Add broccoli and sauce',
      'Cook until tender',
      'Serve hot'
    ],
    ARRAY['beef', 'chinese', 'stir-fry', 'quick'],
    NOW(),
    340,
    38,
    12,
    18,
    'beef-and-broccoli'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Beef Fajita Skillet',
    'Low-carb beef fajitas cooked in one pan',
    'https://images.unsplash.com/photo-1593030761757-71fae45fa0e7?q=80',
    35,
    4,
    ARRAY[
      'Beef strips',
      'Bell peppers',
      'Onions',
      'Fajita seasoning',
      'Lime',
      'Avocado'
    ],
    ARRAY[
      'Season beef with fajita spices',
      'Cook beef until browned',
      'Add peppers and onions',
      'Cook until tender',
      'Serve with avocado'
    ],
    ARRAY['beef', 'mexican', 'one-pan', 'low-carb'],
    NOW(),
    360,
    35,
    10,
    22,
    'beef-fajita-skillet'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Italian Beef Meatballs',
    'Juicy low-carb meatballs in marinara sauce',
    'https://images.unsplash.com/photo-1515516969-d4008cc6241a?q=80',
    40,
    4,
    ARRAY[
      'Ground beef',
      'Almond flour',
      'Parmesan cheese',
      'Italian herbs',
      'Marinara sauce',
      'Garlic'
    ],
    ARRAY[
      'Mix meatball ingredients',
      'Form into balls',
      'Brown in skillet',
      'Add sauce and simmer',
      'Serve with zucchini noodles'
    ],
    ARRAY['beef', 'italian', 'low-carb', 'comfort'],
    NOW(),
    380,
    35,
    8,
    25,
    'italian-beef-meatballs'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Beef Stir-Fry with Zucchini Noodles',
    'Low-carb beef stir-fry served over zucchini noodles',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?q=80',
    25,
    4,
    ARRAY[
      'Beef strips',
      'Zucchini',
      'Mushrooms',
      'Garlic',
      'Soy sauce',
      'Sesame oil'
    ],
    ARRAY[
      'Spiralize zucchini',
      'Stir-fry beef',
      'Add vegetables',
      'Mix in sauce',
      'Serve over zoodles'
    ],
    ARRAY['beef', 'asian', 'low-carb', 'quick'],
    NOW(),
    320,
    35,
    8,
    18,
    'beef-stir-fry-zucchini-noodles'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Pepper Steak',
    'Classic pepper steak with bell peppers and onions',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80',
    35,
    4,
    ARRAY[
      'Beef strips',
      'Bell peppers',
      'Onions',
      'Garlic',
      'Soy sauce',
      'Black pepper'
    ],
    ARRAY[
      'Slice beef and vegetables',
      'Stir-fry beef until browned',
      'Add vegetables',
      'Season with sauce',
      'Serve hot'
    ],
    ARRAY['beef', 'chinese', 'stir-fry', 'quick'],
    NOW(),
    350,
    35,
    12,
    20,
    'pepper-steak'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Beef Lettuce Wraps',
    'Asian-inspired beef lettuce wraps',
    'https://images.unsplash.com/photo-1551248429-40975aa4de74?q=80',
    25,
    4,
    ARRAY[
      'Ground beef',
      'Lettuce leaves',
      'Water chestnuts',
      'Hoisin sauce',
      'Green onions',
      'Garlic'
    ],
    ARRAY[
      'Brown the beef',
      'Add sauce and vegetables',
      'Prepare lettuce cups',
      'Fill with beef mixture',
      'Garnish and serve'
    ],
    ARRAY['beef', 'asian', 'low-carb', 'quick'],
    NOW(),
    290,
    32,
    6,
    16,
    'beef-lettuce-wraps'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Grilled Flank Steak',
    'Marinated and grilled flank steak with chimichurri',
    'https://images.unsplash.com/photo-1544025162-d76694265947?q=80',
    35,
    4,
    ARRAY[
      'Flank steak',
      'Olive oil',
      'Garlic',
      'Fresh herbs',
      'Lime juice',
      'Red wine vinegar'
    ],
    ARRAY[
      'Marinate steak',
      'Prepare chimichurri',
      'Grill to desired doneness',
      'Rest meat',
      'Slice against grain'
    ],
    ARRAY['beef', 'grilled', 'high-protein', 'quick'],
    NOW(),
    340,
    42,
    2,
    18,
    'grilled-flank-steak'
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

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Grilled Tuna Steak',
    'Seared tuna steak with sesame crust',
    'https://images.unsplash.com/photo-1553557202-6bfd4457644a?q=80',
    15,
    4,
    ARRAY[
      'Tuna steaks',
      'Sesame seeds',
      'Soy sauce',
      'Wasabi',
      'Ginger',
      'Sesame oil'
    ],
    ARRAY[
      'Coat tuna in sesame seeds',
      'Heat pan until very hot',
      'Sear briefly on each side',
      'Slice thinly',
      'Serve with wasabi'
    ],
    ARRAY['fish', 'tuna', 'asian', 'quick'],
    NOW(),
    280,
    42,
    2,
    12,
    'grilled-tuna-steak'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Mediterranean Sea Bass',
    'Whole sea bass baked with Mediterranean herbs',
    'https://images.unsplash.com/photo-1615141982883-c7ad0e69fd62?q=80',
    35,
    4,
    ARRAY[
      'Sea bass',
      'Lemon',
      'Herbs',
      'Garlic',
      'Olive oil',
      'Cherry tomatoes'
    ],
    ARRAY[
      'Clean and score fish',
      'Stuff with herbs and lemon',
      'Drizzle with oil',
      'Bake until done',
      'Serve with vegetables'
    ],
    ARRAY['fish', 'mediterranean', 'baked', 'healthy'],
    NOW(),
    260,
    32,
    4,
    14,
    'mediterranean-sea-bass'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Blackened Tilapia',
    'Spicy blackened tilapia with Cajun seasoning',
    'https://images.unsplash.com/photo-1594041680534-e8c8cdebd659?q=80',
    20,
    4,
    ARRAY[
      'Tilapia fillets',
      'Cajun seasoning',
      'Butter',
      'Lemon',
      'Parsley',
      'Garlic powder'
    ],
    ARRAY[
      'Season fish with spices',
      'Heat pan until very hot',
      'Cook fish 3-4 minutes per side',
      'Add butter and lemon',
      'Garnish with parsley'
    ],
    ARRAY['fish', 'cajun', 'spicy', 'quick'],
    NOW(),
    220,
    28,
    2,
    12,
    'blackened-tilapia'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Asian-Style Steamed Fish',
    'Delicate steamed fish with ginger and soy',
    'https://images.unsplash.com/photo-1511994714008-b6d68a8b32a2?q=80',
    25,
    4,
    ARRAY[
      'White fish fillets',
      'Ginger',
      'Green onions',
      'Soy sauce',
      'Sesame oil',
      'Cilantro'
    ],
    ARRAY[
      'Prepare steamer',
      'Season fish',
      'Steam until done',
      'Heat oil with aromatics',
      'Pour over fish'
    ],
    ARRAY['fish', 'asian', 'steamed', 'healthy'],
    NOW(),
    200,
    30,
    2,
    8,
    'asian-steamed-fish'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Grilled Mahi Mahi',
    'Tropical grilled mahi mahi with mango salsa',
    'https://images.unsplash.com/photo-1599021456807-4962a115b345?q=80',
    30,
    4,
    ARRAY[
      'Mahi mahi fillets',
      'Mango',
      'Red onion',
      'Lime',
      'Cilantro',
      'Jalapeno'
    ],
    ARRAY[
      'Make mango salsa',
      'Season fish',
      'Grill until done',
      'Top with salsa',
      'Serve with lime'
    ],
    ARRAY['fish', 'grilled', 'tropical', 'healthy'],
    NOW(),
    240,
    32,
    8,
    10,
    'grilled-mahi-mahi'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Herb-Crusted Halibut',
    'Baked halibut with a crispy herb crust',
    'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?q=80',
    35,
    4,
    ARRAY[
      'Halibut fillets',
      'Fresh herbs',
      'Breadcrumbs',
      'Dijon mustard',
      'Lemon',
      'Butter'
    ],
    ARRAY[
      'Make herb crust',
      'Coat fish with mustard',
      'Add herb crust',
      'Bake until golden',
      'Serve with lemon'
    ],
    ARRAY['fish', 'baked', 'gourmet', 'healthy'],
    NOW(),
    280,
    35,
    12,
    14,
    'herb-crusted-halibut'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Teriyaki Glazed Salmon',
    'Salmon fillets with homemade teriyaki glaze',
    'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80',
    25,
    4,
    ARRAY[
      'Salmon fillets',
      'Soy sauce',
      'Mirin',
      'Ginger',
      'Garlic',
      'Green onions'
    ],
    ARRAY[
      'Make teriyaki sauce',
      'Marinate salmon',
      'Broil or grill',
      'Baste with sauce',
      'Garnish and serve'
    ],
    ARRAY['fish', 'salmon', 'asian', 'glazed'],
    NOW(),
    310,
    34,
    12,
    16,
    'teriyaki-glazed-salmon'
  );

INSERT INTO recipes (title, description, image, cooking_time, servings, ingredients, instructions, tags, publish_date, calories, protein, carbs, fat, slug)
VALUES
  (
    'Fish Taco Bowl',
    'Deconstructed fish tacos in a healthy bowl',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?q=80',
    30,
    4,
    ARRAY[
      'White fish fillets',
      'Cabbage slaw',
      'Avocado',
      'Lime',
      'Cilantro',
      'Taco seasoning'
    ],
    ARRAY[
      'Season fish',
      'Cook fish',
      'Prepare slaw',
      'Assemble bowls',
      'Add toppings'
    ],
    ARRAY['fish', 'mexican', 'bowl', 'healthy'],
    NOW(),
    290,
    32,
    15,
    14,
    'fish-taco-bowl'
  );