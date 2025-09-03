@echo off
echo 🚀 Starting Vercel deployment for AI Image Recognition App...

REM Check if we're in the right directory
if not exist "package.json" (
    echo ❌ Error: Please run this script from the web directory
    pause
    exit /b 1
)

REM Install dependencies
echo 📦 Installing dependencies...
call npm install

REM Build the project
echo 🔨 Building the project...
call npm run build

REM Check if build was successful
if not exist "build" (
    echo ❌ Build failed! Please check for errors above.
    pause
    exit /b 1
)

echo ✅ Build successful!

REM Deploy to Vercel
echo 🚀 Deploying to Vercel...
call vercel --prod

echo 🎉 Deployment complete!
echo.
echo 📝 Next steps:
echo 1. Set REACT_APP_API_URL in your Vercel dashboard
echo 2. Deploy your backend to Render/Railway/Heroku
echo 3. Update the API URL with your backend service URL
echo.
echo 🔗 Check your deployment at the URL provided above
pause
