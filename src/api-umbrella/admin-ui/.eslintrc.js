module.exports = {
  root: true,
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module'
  },
  extends: 'eslint:recommended',
  env: {
    browser: true
  },
  rules: {
    'comma-dangle': ['error', 'always-multiline'],
    'no-var': 'error',
    'object-shorthand': ['error', 'methods'],
    'no-duplicate-imports': 'error',
    'func-call-spacing': ['error', 'never'],
    'keyword-spacing': ['error', { 'before': true, 'after': true, 'overrides': {
      'if': { 'after': false },
      'for': { 'after': false },
      'while': { 'after': false },
      'catch': { 'after': false },
      'switch': { 'after': false },
    }}],
    'no-trailing-spaces': 'error',
  },
  globals: {
    '$': true,
    'CommonValidations': true,
    'I18n': true,
    'JsDiff': true,
    'PNotify': true,
    '_': true,
    'ace': true,
    'bootbox': true,
    'google': true,
    'inflection': true,
    'jstz': true,
    'marked': true,
    'moment': true,
    'numeral': true,
  },
};
