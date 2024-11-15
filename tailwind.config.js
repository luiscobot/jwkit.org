import defaultTheme from "tailwindcss/defaultTheme";
import forms from "@tailwindcss/forms";

const config = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    fontFamily: {
      inter: ["Inter", ...defaultTheme.fontFamily.sans],
    },
    extend: {
      colors: {
        "jw-black": "hsl(0, 0%, 0%)",
        "jw-white": "hsl(0, 0%, 100%)",
        "jw-bokara-gray": "hsl(0, 0%, 16%)",
        "jw-bunting": "hsl(222, 64%, 17%)",
        "jw-onyx": "hsl(0, 0%, 7%)",
        "jw-san-marino": "hsl(220, 33%, 48%)",
        "jw-quick-silver": "hsl(0, 0%, 65%)",
        "jw-seashell": "hsl(0, 0%, 95%)",
        "jw-success": "hsl(146, 63%, 41%)",
        "jw-warning": "hsl(42, 100%, 60%)",
        "jw-error": "hsl(345, 90%, 60%)",
        "jw-info": "hsl(200, 100%, 50%)",
      },
    },
  },
  plugins: [forms],
};

export default config;
