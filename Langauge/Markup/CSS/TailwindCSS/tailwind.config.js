/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.html',
    './src/**/*.vue',
    './src/**/*.jsx',
    './src/**/*.js',
  ],
  theme: {
    extend: {
      fontFamily: {
        'notoSansKr': ["'Noto Sans KR'", 'sans-serif'],
        'nanumGothic': ["'Nanum Gothic'", 'sans-serif'],
      },
      fontSize: {
        'customSm': '1.2rem',
        'customBase': '1.4rem',
        'customXL': '1.6rem',
        'custom2XL': '2rem',
        'customSmD': ['1.2rem', '2rem'],
        'customBaseD': ['1.4rem', '2.5rem'],
        'customXLD': ['1.6rem', '3rem'],
        'custom2XLD': ['2rem', '3.5rem'],
        'customXl-LLF': ['1.5rem', {
          lineHeight: '2rem',
          letterSpacing: '-0.2em',
          fontWeight: '500',
        }],
        'custom2Xl-LLF': ['1.875rem', {
          lineHeight: '2.25rem',
          letterSpacing: '1em',
          fontWeight: '800',
        }],
      },
      lineClamp: {
        7: '7',
      }, 
      lineHeight: {
        'extra-loose': '2.5',
        '12': '3rem',
      },
      listStyleImage: {
        listImage: 'url("03_list/check.png")',
      },
      colors: {
        'regal-blue': '#243c5a',
      },
      spacing: {
        'cusSpacing-128': '32rem',
      },
      textIndent: {
        'cusIndent-128': '32rem',
      },
      aspectRatio: {
        '5/2': '5/2',
      },
      container: {
        center: true,
        
        // padding: {
        //   default: '2rem',
        //   sm: '3rem',
        //   lg: '4rem',
        //   xl: '5rem'
        // },

        // screens: {
        //   default: '100%',
        //     sm: '100%', 
        //     md: '100%',
        //     lg: '1024px',
        //     xl: '1024px'
        // }
      },
    },
  },
  plugins: [],
};
