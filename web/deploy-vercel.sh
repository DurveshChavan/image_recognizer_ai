#!/bin/bash

echo "🚀 Starting Vercel deployment for AI Image Recognition App..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Please run this script from the web directory"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the project
echo "🔨 Building the project..."
npm run build

# Check if build was successful
if [ ! -d "build" ]; then
    echo "❌ Build failed! Please check for errors above."
    exit 1
fi

echo "✅ Build successful!"

# Deploy to Vercel
echo "🚀 Deploying to Vercel..."
vercel --prod

echo "🎉 Deployment complete!"
echo ""
echo "📝 Next steps:"
echo "1. Set REACT_APP_API_URL in your Vercel dashboard"
echo "2. Deploy your backend to Render/Railway/Heroku"
echo "3. Update the API URL with your backend service URL"
echo ""
echo "🔗 Check your deployment at the URL provided above"

