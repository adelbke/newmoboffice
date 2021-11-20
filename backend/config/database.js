module.exports = ({ env }) => ({
  defaultConnection: env.NODE_ENV == 'production' ? 'prod' : 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'sqlite',
        filename: env('DATABASE_FILENAME', '.tmp/data.db'),
      },
      options: {
        useNullAsDefault: true,
      },
    },

    prod: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        host: env('DATABASE_HOST', 'localhost'),
        port: env('DATABASE_PORT', 3306),
        database: env("DATABASE_NAME", "dbsejarah01"),
        username: env("DATABASE_USERNAME", "username"),
        password: env("DATABASE_PASSWORD", "password"),
      }
    }
  },
});
