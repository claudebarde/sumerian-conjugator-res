export default {
  // Set test environment to node
  testEnvironment: "node",

  // Enable ECMAScript Modules
  transform: {
    "^.+\\.m?js$": "babel-jest"
  },

  // Transform all files, including those in node_modules
  transformIgnorePatterns: [],

  // Set moduleFileExtensions
  moduleFileExtensions: ["js", "mjs", "json"],

  // Required for Jest to process .mjs files
  moduleNameMapper: {
    "^(\\.{1,2}/.*)\\.js$": "$1"
  },

  // Test patterns
  testMatch: ["**/*.test.res.js", "**/*.test.res.mjs"]
};
