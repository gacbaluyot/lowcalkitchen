# LowCal Kitchen 🥗

A modern recipe website built with Astro, React, and Supabase, featuring healthy and protein-rich recipes.

## Features

- 🍽️ Browse healthy recipes with detailed nutritional information
- 💪 Filter by protein content, cooking time, and dietary preferences
- 🔍 Search functionality
- 📱 Responsive design
- 🌙 Dark mode support
- 📊 TDEE Calculator
- 📝 Blog section
- 💌 Newsletter subscription
- ⭐ Recipe ratings and reviews
- 👤 User authentication

## Tech Stack

- [Astro](https://astro.build) - Static Site Generator
- [React](https://reactjs.org) - UI Components
- [Tailwind CSS](https://tailwindcss.com) - Styling
- [Supabase](https://supabase.com) - Backend & Database
- [Framer Motion](https://www.framer.com/motion) - Animations

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/lowcal-kitchen.git
   ```

2. Install dependencies:
   ```bash
   cd lowcal-kitchen
   npm install
   ```

3. Set up environment variables:
   Create a `.env` file in the root directory with the following variables:
   ```
   PUBLIC_SUPABASE_URL=your_supabase_url
   PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

## Project Structure

```
/
├── public/
│   └── favicon.svg
├── src/
│   ├── components/
│   ├── layouts/
│   ├── lib/
│   ├── pages/
│   └── styles/
├── supabase/
│   └── migrations/
└── package.json
```

## Database Setup

The project uses Supabase as the database. The schema includes:

- Recipes table
- Blog posts table
- Categories and category groups
- Recipe ratings
- Newsletter subscribers

All database migrations are located in the `supabase/migrations` directory.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.