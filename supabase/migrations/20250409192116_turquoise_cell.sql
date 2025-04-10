/*
  # Add blog posts functionality

  1. New Tables
    - `blog_posts`
      - `id` (uuid, primary key)
      - `title` (text)
      - `slug` (text)
      - `content` (text)
      - `excerpt` (text)
      - `image` (text)
      - `author` (text)
      - `publish_date` (timestamp with time zone)
      - `tags` (text array)
      - `created_at` (timestamp with time zone)
      - `reading_time` (integer)

  2. Security
    - Enable RLS on `blog_posts` table
    - Add policies for:
      - Public read access
      - Admin write access
*/

CREATE TABLE blog_posts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  slug text NOT NULL UNIQUE,
  content text NOT NULL,
  excerpt text NOT NULL,
  image text,
  author text NOT NULL,
  publish_date timestamptz NOT NULL,
  tags text[] NOT NULL,
  created_at timestamptz DEFAULT now(),
  reading_time integer NOT NULL
);

-- Enable Row Level Security
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;

-- Create policy for public read access
CREATE POLICY "Allow public read access"
  ON blog_posts
  FOR SELECT
  TO public
  USING (true);

-- Create policy for admin access
CREATE POLICY "Enable full access for admin users"
  ON blog_posts
  USING (
    auth.role() = 'authenticated' AND
    auth.email() = 'admin@lowcalrecipes.com'
  )
  WITH CHECK (
    auth.role() = 'authenticated' AND
    auth.email() = 'admin@lowcalrecipes.com'
  );

-- Insert sample blog posts
INSERT INTO blog_posts (title, slug, content, excerpt, image, author, publish_date, tags, reading_time) VALUES
(
  'The Ultimate Guide to Meal Prepping',
  'ultimate-guide-meal-prepping',
  E'# The Ultimate Guide to Meal Prepping\n\nMeal prepping is one of the most effective strategies for maintaining a healthy diet while saving time and money. In this comprehensive guide, we''ll walk you through everything you need to know to become a meal prep pro.\n\n## Why Meal Prep?\n\nMeal prepping offers numerous benefits:\n- Saves time during busy weekdays\n- Helps control portions and calories\n- Reduces food waste\n- Saves money by avoiding takeout\n- Makes healthy eating convenient\n\n## Essential Equipment\n\nTo get started, you''ll need:\n- Quality food containers\n- Sharp knives\n- Cutting boards\n- Sheet pans\n- Large cooking pots\n- Food scale\n\n## Step-by-Step Process\n\n1. **Plan Your Menu**\n   - Choose recipes that keep well\n   - Consider your schedule\n   - Plan for variety\n\n2. **Shopping**\n   - Make a detailed list\n   - Buy in bulk when possible\n   - Choose fresh, quality ingredients\n\n3. **Prep Work**\n   - Wash and cut vegetables\n   - Portion proteins\n   - Cook grains and legumes\n\n4. **Cooking**\n   - Use multiple cooking methods simultaneously\n   - Batch cook proteins\n   - Roast vegetables in large quantities\n\n5. **Storage**\n   - Use airtight containers\n   - Label everything\n   - Follow food safety guidelines\n\n## Tips for Success\n\n- Start small and gradually increase\n- Keep it simple at first\n- Invest in quality containers\n- Learn proper food storage\n- Rotate your meals for variety\n\n## Sample Meal Prep Menu\n\n**Breakfast Options:**\n- Overnight oats\n- Egg muffins\n- Protein smoothie packs\n\n**Lunch/Dinner Options:**\n- Grilled chicken with vegetables\n- Quinoa bowls\n- Turkey meatballs\n\n**Snacks:**\n- Cut vegetables with hummus\n- Portioned nuts and fruits\n- Greek yogurt parfaits\n\n## Common Mistakes to Avoid\n\n1. Preparing too much food\n2. Not varying your meals\n3. Choosing recipes that don''t store well\n4. Forgetting about food safety\n5. Not planning properly\n\n## Conclusion\n\nMeal prepping is a skill that gets easier with practice. Start with these basics and adjust based on your needs and preferences. Remember, the goal is to make healthy eating more convenient and sustainable.',
  'Learn how to effectively meal prep to save time, money, and maintain a healthy diet. This comprehensive guide covers everything from essential equipment to step-by-step instructions.',
  'https://images.unsplash.com/photo-1512058564366-18510be2db19',
  'Chef Sarah Wilson',
  NOW() - interval '2 days',
  ARRAY['meal prep', 'healthy eating', 'cooking tips'],
  8
),
(
  'Understanding Macros: A Beginner''s Guide',
  'understanding-macros-beginners-guide',
  E'# Understanding Macros: A Beginner''s Guide\n\nMacronutrients (macros) are the building blocks of nutrition. Understanding how to balance your proteins, carbohydrates, and fats is crucial for achieving your health and fitness goals.\n\n## What Are Macros?\n\nMacronutrients are the three main categories of nutrients your body needs in large amounts:\n- Proteins\n- Carbohydrates\n- Fats\n\n## Protein\n\n### Role in the Body\n- Muscle building and repair\n- Enzyme production\n- Immune function\n- Hormone regulation\n\n### Good Sources\n- Chicken breast\n- Fish\n- Eggs\n- Legumes\n- Greek yogurt\n\n## Carbohydrates\n\n### Role in the Body\n- Primary energy source\n- Brain function\n- Muscle glycogen\n- Fiber for digestion\n\n### Good Sources\n- Whole grains\n- Sweet potatoes\n- Fruits\n- Vegetables\n- Quinoa\n\n## Fats\n\n### Role in the Body\n- Hormone production\n- Brain health\n- Vitamin absorption\n- Energy storage\n\n### Good Sources\n- Avocados\n- Nuts and seeds\n- Olive oil\n- Fatty fish\n- Eggs\n\n## Calculating Your Macro Needs\n\n1. **Determine Your Daily Calories**\n   - Use a TDEE calculator\n   - Consider your goals\n\n2. **Set Your Protein**\n   - 0.8-1.2g per pound of body weight\n   - Higher for athletes\n\n3. **Allocate Remaining Calories**\n   - 40-50% Carbs\n   - 20-30% Fats\n\n## Tips for Tracking Macros\n\n1. Use a food scale\n2. Read nutrition labels\n3. Plan meals in advance\n4. Use tracking apps\n5. Be consistent\n\n## Common Mistakes\n\n- Focusing only on calories\n- Not eating enough protein\n- Avoiding healthy fats\n- Over-restricting carbs\n- Not adjusting macros based on results\n\n## Sample Macro-Balanced Meals\n\n### Breakfast\n- Oatmeal with protein powder\n- Berries and nuts\n- Greek yogurt\n\n### Lunch\n- Grilled chicken breast\n- Brown rice\n- Roasted vegetables\n- Olive oil dressing\n\n### Dinner\n- Salmon\n- Sweet potato\n- Green vegetables\n- Avocado\n\n## Conclusion\n\nUnderstanding and tracking macros can help you optimize your nutrition for better health and fitness results. Start with these basics and adjust based on your personal goals and needs.',
  'Learn the fundamentals of macronutrients and how to balance your proteins, carbs, and fats for optimal health and fitness results.',
  'https://images.unsplash.com/photo-1490645935967-10de6ba17061',
  'Nutritionist Mike Chen',
  NOW() - interval '5 days',
  ARRAY['nutrition', 'macros', 'healthy eating'],
  10
);