# Deploying to Vercel

This guide will help you deploy your AI Image Recognition project to Vercel.

## Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **Vercel CLI**: Install with `npm i -g vercel`
3. **Git Repository**: Your project should be in a Git repository

## Deployment Steps

### 1. Prepare Your Project

Your project is already configured for Vercel deployment with:
- `vercel.json` - Vercel configuration
- Environment-aware API configuration
- React build setup

### 2. Deploy Frontend to Vercel

```bash
# Navigate to the web directory
cd web

# Install dependencies
npm install

# Build the project
npm run build

# Deploy to Vercel
vercel
```

### 3. Configure Environment Variables

In your Vercel dashboard, set the environment variable:
```
REACT_APP_API_URL=https://your-backend-service-url.com
```

### 4. Deploy Backend Separately

Since Vercel doesn't support heavy ML models, deploy your Flask backend to:

**Option A: Render (Recommended)**
- Free tier available
- Supports Python and ML models
- Easy deployment from Git

**Option B: Railway**
- Good for ML applications
- Reasonable pricing

**Option C: Heroku**
- More expensive but reliable
- Good for production apps

### 5. Update API URL

After deploying your backend, update the `REACT_APP_API_URL` in Vercel with your backend service URL.

## Project Structure for Deployment

```
image_recognizer_AI/
├── web/                    # Frontend (deploy to Vercel)
│   ├── src/
│   ├── build/             # Built React app
│   ├── vercel.json        # Vercel config
│   └── package.json
├── YOLOv10/               # Backend (deploy separately)
│   ├── app.py
│   └── yolov10_service.py
└── yolov10n.pt            # ML model
```

## Troubleshooting

1. **Build Errors**: Ensure all dependencies are in `package.json`
2. **API Errors**: Check that `REACT_APP_API_URL` is set correctly
3. **CORS Issues**: Ensure your backend allows requests from your Vercel domain

## Next Steps

1. Deploy frontend to Vercel
2. Deploy backend to Render/Railway/Heroku
3. Update environment variables
4. Test the complete application

