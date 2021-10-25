// module.exports = {
//     "env": {
//         "browser": true,
//         "es2021": true
//     },
//     "extends": [
//         "eslint:recommended",
//         "plugin:vue/essential"
//     ],
//     "parserOptions": {
//         "ecmaVersion": 13,
//         "sourceType": "module"
//     },
//     "plugins": [
//         "vue"
//     ],
//     "rules": {
//     }
// };
module.exports = {
    root: true,
    env: {
        browser: true,
        node: true
    },
    parserOptions: {
        parser: 'babel-eslint'
    },
    extends: [
        '@nuxtjs'
        // 'plugin:nuxt/recommended'
    ],
    plugins: [
    ],
    // add your custom rules here
    rules: {}
}
