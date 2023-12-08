module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      gridTemplateRows: {
        'layout': '64px 1fr'
      },
      gridTemplateColumns: {
        'layout': '20% 1fr'
      },
      colors: {
        'jw-black': 'hsl(0, 0%, 0%)',
        'jw-white': 'hsl(0, 0%, 100%)',
        'jw-bokara-gray': 'hsl(0, 0%, 16%)',
        'jw-bunting': 'hsl(222, 64%, 17%)',
        'jw-onyx': 'hsl(0, 0%, 7%)',
        'jw-san-marino': 'hsl(220, 33%, 48%)',
        'jw-quick-silver': 'hsl(0, 0%, 65%)',
        'jw-seashell': 'hsl(0, 0%, 95%)'
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms')
  ],
}
