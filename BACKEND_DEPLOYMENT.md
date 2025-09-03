# Backend Deployment Guide (Render)

This guide will help you deploy your Flask backend with YOLOv10 to Render.

## Why Render?

- **Free Tier**: Available for hobby projects
- **Python Support**: Native Python environment
- **ML Model Support**: Can handle large model files
- **Easy Deployment**: Simple Git-based deployment

## Prerequisites

1. **Render Account**: Sign up at [render.com](https://render.com)
2. **Git Repository**: Your project should be in a Git repository
3. **Model Files**: Ensure `yolov10n.pt` is in your repository

## Deployment Steps

### 1. Prepare Your Backend

Your Flask app is already configured for production deployment.

### 2. Create render.yaml

Create a `render.yaml` file in your project root:

```yaml
services:
  - type: web
    name: ai-image-recognition-backend
    env: python
    plan: free
    buildCommand: pip install -r requirements.txt
    startCommand: cd YOLOv10 && python app.py
    envVars:
      - key: PYTHON_VERSION
        value: 3.9.16
    healthCheckPath: /api/health
```

### 3. Update Requirements

Ensure your `requirements.txt` includes all necessary packages:

```txt
flask==2.3.3
flask-cors==4.0.0
opencv-python-headless==4.8.1.78
torch==2.0.1
torchvision==0.15.2
pyyaml==6.0.1
werkzeug==2.3.7
```

### 4. Deploy to Render

1. **Connect Repository**: In Render dashboard, connect your Git repository
2. **Create Service**: Choose "Web Service" and select your repository
3. **Configure**: Use the settings from `render.yaml`
4. **Deploy**: Click "Create Web Service"

### 5. Update Frontend Configuration

After deployment, update your Vercel environment variable:
```
REACT_APP_API_URL=https://your-service-name.onrender.com
```

## Alternative: Railway Deployment

If you prefer Railway:

1. **Sign up** at [railway.app](https://railway.app)
2. **Connect** your Git repository
3. **Deploy** as a web service
4. **Set environment variables** as needed

## Alternative: Heroku Deployment

For production use:

1. **Install Heroku CLI**
2. **Create app**: `heroku create your-app-name`
3. **Deploy**: `git push heroku main`
4. **Scale**: `heroku ps:scale web=1`

## Troubleshooting

### Common Issues

1. **Model Loading Errors**: Ensure model file is in repository
2. **Memory Issues**: Upgrade to paid plan if needed
3. **Timeout Errors**: Check health check endpoint

### Health Check

Your app includes a health check at `/api/health` that Render will use to monitor the service.

## Cost Considerations

- **Render Free**: $0/month (limited resources)
- **Render Starter**: $7/month (better performance)
- **Railway**: Pay-per-use, ~$5-20/month
- **Heroku**: $7/month minimum

## Next Steps

1. Deploy backend to Render
2. Test the API endpoints
3. Update frontend configuration
4. Deploy frontend to Vercel
5. Test the complete application
