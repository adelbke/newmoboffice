module.exports = ({ env }) => ({
  defaultConnection: env.NODE_ENV === 'production' ? 'prod' : 'default',
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
        host: env('DATABASE_HOST', 'mysql_database'),
        port: env('DATABASE_PORT', 3306),
        database: env("DATABASE_NAME", "newmob-db"),
        username: env("DATABASE_USERNAME", "newmobuser"),
        password: env("DATABASE_PASSWORD", "qJ4dRwP+FM9fBDq&"),
      },
      options: {
        autoMigration: true
      }
    }
  },
});
