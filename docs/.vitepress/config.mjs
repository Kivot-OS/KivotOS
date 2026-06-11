import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'KivotOS',
  description: 'A minimal, Debian-based Linux distribution inspired by Blue Archive',
  lang: 'en-US',

  // Internal docs — kept in repo, excluded from the public site build
  srcExclude: ['DESIGN.md'],

  head: [
    ['link', { rel: 'icon', href: '/kivotos.png' }],
    ['meta', { name: 'theme-color', content: '#5b8dee' }],
    ['link', { rel: 'preconnect', href: 'https://fonts.googleapis.com' }],
    ['link', { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }],
    ['link', { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&family=Space+Grotesk:wght@400;500;600;700&display=swap' }],
  ],

  themeConfig: {
    logo: '/kivotos.png',
    siteTitle: false,

    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/getting-started' },
      { text: 'Build Guide', link: '/guide/build-guide' },
    ],

    sidebar: {
      '/guide/': [
        {
          text: 'Guide',
          items: [
            { text: 'Getting Started', link: '/guide/getting-started' },
            { text: 'Build Guide', link: '/guide/build-guide' },
          ],
        },
      ],
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/Kivot-OS/KivotOS' },
    ],

    footer: {
      message: 'MIT License — Built by Senseis, for Senseis',
      copyright: 'KivotOS Team',
    },

    darkModeSwitchLabel: 'Appearance',
    lightModeSwitchTitle: 'Switch to Arona (light)',
    darkModeSwitchTitle: 'Switch to Plana (dark)',
  },
})
