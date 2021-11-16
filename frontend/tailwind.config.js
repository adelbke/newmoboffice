/*
** TailwindCSS Configuration File
**
** Docs: https://tailwindcss.com/docs/configuration
** Default: https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
*/
module.exports = {
  theme: {
    extend:{
      spacing:{
        '4/5':'80%'
      },
      colors:{
        'newmob-red':'#631101',
        'newmob-red-100': '#7E1601',
        'newmob-silver':'#A0ACBE',
        'newmob-gray':'#F1F2F4'
      },
      borderRadius: {
        'xl': '25px'
      },
      fontFamily:{
        'nunito':['Nunito', 'sans-serif']
      }
    }
  },
  variants: {
    extend:{
      fontWeight:['hover'],
      width:['hover']
    }
  },
  plugins: [],
  purge: {
    // Learn more on https://tailwindcss.com/docs/controlling-file-size/#removing-unused-css
    enabled: process.env.NODE_ENV === 'production',
    content: [
      'components/**/*.vue',
      'layouts/**/*.vue',
      'pages/**/*.vue',
      'plugins/**/*.js',
      'nuxt.config.js'
    ]
  }
}
