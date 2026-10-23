@echo off
echo 🐍 Starting Flask Backend with YOLOv10...

REM Check if we're in the right directory
if not exist "requirements.txt" (
    echo ❌ Error: Please run this script from the image_recognizer_AI root directory
    pause
    exit /b 1
)

REM Check if virtual environment exists
if not exist ".venv" (
    echo ❌ Virtual environment not found. Creating one...
    python -m venv .venv
)

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call .venv\Scripts\activate.bat

REM Install dependencies if needed
echo 📦 Installing Python dependencies...
pip install -r requirements.txt

REM Start the Flask backend
echo 🚀 Starting Flask backend...
cd YOLOv10
python app.py

pause

