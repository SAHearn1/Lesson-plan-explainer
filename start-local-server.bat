@echo off
REM Local Server Startup Script for Windows
REM This script starts a local HTTP server to test the lesson plan explainer with audio

echo ==========================================
echo RootWork Lesson Plan Explainer
echo Local Server Startup Script
echo ==========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON_CMD=python
    echo. Found Python
) else (
    python3 --version >nul 2>&1
    if %errorlevel% equ 0 (
        set PYTHON_CMD=python3
        echo. Found Python3
    ) else (
        echo. Python not found!
        echo Please install Python 3 to run this server.
        echo Download from: https://www.python.org/downloads/
        pause
        exit /b 1
    )
)

echo.
echo Starting local HTTP server...
echo Server URL: http://localhost:8080
echo.
echo To test the application:
echo 1. Open your browser to: http://localhost:8080
echo 2. Click the Play button
echo 3. Verify audio plays correctly
echo.
echo Press Ctrl+C to stop the server
echo ==========================================
echo.

REM Start the server
%PYTHON_CMD% -m http.server 8080
