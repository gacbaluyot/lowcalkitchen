/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#fff7ed',
          100: '#ffedd5',
          200: '#fed7aa',
          300: '#fdba74',
          400: '#fb923c',
          500: '#f97316',
          600: '#ea580c',
          700: '#c2410c',
          800: '#9a3412',
          900: '#7c2d12',
          950: '#431407',
        }
      },
      fontFamily: {
        sans: ['"Plus Jakarta Sans"', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Open Sans', 'Helvetica Neue', 'sans-serif'],
        serif: ['"Playfair Display"', 'Georgia', 'Cambria', 'Times New Roman', 'Times', 'serif'],
        heading: ['"Playfair Display"', 'Georgia', 'serif'],
        body: ['"Plus Jakarta Sans"', 'system-ui', 'sans-serif'],
      },
      typography: {
        DEFAULT: {
          css: {
            maxWidth: 'none',
            color: 'var(--tw-prose-body)',
            fontFamily: '"Plus Jakarta Sans", system-ui, sans-serif',
            h1: {
              fontFamily: '"Playfair Display", Georgia, serif',
              fontWeight: '700',
              letterSpacing: '-0.025em',
            },
            h2: {
              fontFamily: '"Playfair Display", Georgia, serif',
              fontWeight: '600',
              letterSpacing: '-0.025em',
            },
            h3: {
              fontFamily: '"Playfair Display", Georgia, serif',
              fontWeight: '600',
              letterSpacing: '-0.025em',
            },
            h4: {
              fontFamily: '"Playfair Display", Georgia, serif',
              fontWeight: '600',
            },
            p: {
              lineHeight: '1.75',
            },
            a: {
              color: 'var(--tw-prose-links)',
              textDecoration: 'none',
              fontWeight: '500',
              '&:hover': {
                textDecoration: 'underline',
              },
            },
            'code::before': {
              content: '""',
            },
            'code::after': {
              content: '""',
            },
          },
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}