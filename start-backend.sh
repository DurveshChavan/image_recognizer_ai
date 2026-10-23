#!/bin/bash

echo "🐍 Starting Flask Backend with YOLOv10..."

# Check if we're in the right directory
if [ ! -f "requirements.txt" ]; then
    echo "❌ Error: Please run this script from the image_recognizer_AI root directory"
    exit 1
fi

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found. Creating one..."
    python3 -m venv .venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source .venv/bin/activate

# Install dependencies if needed
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

# Start the Flask backend
echo "🚀 Starting Flask backend..."
cd YOLOv10
python app.py

