// Configuration for different environments
const config = {
  development: {
    apiBaseUrl: 'http://localhost:5000',
  },
  production: {
    // Update this URL to your deployed backend service
    apiBaseUrl: process.env.REACT_APP_API_URL || 'http://localhost:5000',
  }
};

// Get current environment
const environment = process.env.NODE_ENV || 'development';

// Export current config
export const apiBaseUrl = config[environment].apiBaseUrl;

// Helper function to build API URLs
export const buildApiUrl = (endpoint) => {
  return `${apiBaseUrl}${endpoint}`;
};

