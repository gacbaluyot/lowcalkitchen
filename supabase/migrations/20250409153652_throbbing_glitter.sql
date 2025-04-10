/*
  # Update marinade recipes to use chicken breast

  1. Changes
    - Update existing marinade recipes to use chicken breast
    - Adjust cooking instructions and descriptions accordingly
    - Update protein content and nutritional values
*/

-- Update Asian Honey Garlic Marinade
UPDATE recipes
SET 
  description = 'A sweet and savory marinade perfect for chicken breast, creating a delicious balance of honey, soy sauce, and garlic',
  ingredients = ARRAY[
    '4 chicken breasts (6 oz each)',
    '1/2 cup soy sauce',
    '1/4 cup honey',
    '4 cloves garlic, minced',
    '1 tablespoon ginger, grated',
    '2 tablespoons rice vinegar',
    '1 tablespoon sesame oil',
    '1/4 teaspoon black pepper',
    '2 green onions, chopped'
  ],
  instructions = ARRAY[
    'Combine all marinade ingredients in a bowl',
    'Reserve 1/4 cup marinade for basting',
    'Place chicken breasts in a zip-top bag with remaining marinade',
    'Marinate in refrigerator for 2-4 hours',
    'Preheat grill or pan to medium-high heat',
    'Grill chicken for 6-7 minutes per side, or until internal temperature reaches 165°F',
    'Baste with reserved marinade while cooking',
    'Let rest for 5 minutes before slicing',
    'Garnish with chopped green onions'
  ],
  protein = 34,
  calories = 290
WHERE title = 'Asian Honey Garlic Marinade';

-- Update Citrus Herb Marinade
UPDATE recipes
SET 
  description = 'Bright and fresh marinade combining citrus juices with fresh herbs, perfect for chicken breast',
  ingredients = ARRAY[
    '4 chicken breasts (6 oz each)',
    '1/4 cup olive oil',
    '2 lemons, juiced',
    '1 orange, juiced and zested',
    '4 cloves garlic, minced',
    '2 tablespoons fresh rosemary, chopped',
    '2 tablespoons fresh thyme, chopped',
    '1 teaspoon sea salt',
    '1/2 teaspoon black pepper'
  ],
  instructions = ARRAY[
    'Whisk together all marinade ingredients',
    'Reserve 1/4 cup for serving',
    'Place chicken breasts in a shallow dish with marinade',
    'Marinate for 2-4 hours in the refrigerator',
    'Preheat grill or oven to 400°F',
    'For grilling: grill 6-7 minutes per side',
    'For baking: bake for 22-25 minutes',
    'Ensure internal temperature reaches 165°F',
    'Let rest for 5 minutes before slicing',
    'Drizzle with reserved marinade',
    'Garnish with additional fresh herbs'
  ],
  protein = 32,
  calories = 270
WHERE title = 'Citrus Herb Marinade';