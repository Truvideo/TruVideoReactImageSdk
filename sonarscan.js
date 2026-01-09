require('dotenv').config();
const scanner = require('sonarqube-scanner');

scanner(
  {
    serverUrl: 'http://localhost:9000',
    token: process.env.SONAR_TOKEN,
    options: {
      'sonar.projectName': 'TruVideoImageSdk', // Change this
      'sonar.projectKey': 'TruVideoImageSdk', // Change this
      'sonar.sources': 'src',
      'sonar.ignore':
        'src/**/*.test.js,src/**/*.spec.js,src/**/*.test.jsx,src/**/*.spec.jsx,android/**,ios/**,node_modules/**',
    },
  },
  () => process.exit()
);
