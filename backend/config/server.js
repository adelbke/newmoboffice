module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: 'https://newmoboffice.com/api',
  admin: {
    url: 'https://newmoboffice.com/dashboard',
    auth: {
      secret: env('ADMIN_JWT_SECRET', '20b713105e81fc7b9435241fb4b4abfa'),
    },
  },
});
