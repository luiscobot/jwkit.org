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
        'jw-bokara-gray': 'hsl(0, 0%, 16%)',
        'jw-bunting': 'hsl(222, 64%, 17%)',
        'jw-onyx': 'hsl(0, 0%, 7%)'
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms')
  ],
}
