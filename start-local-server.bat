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
    REM Check if it's Python 3.x
    python -c "import sys; exit(0 if sys.version_info.major >= 3 else 1)" >nul 2>&1
    if %errorlevel% equ 0 (
        set PYTHON_CMD=python
        echo. Found Python 3.x
    ) else (
        echo. Found Python 2.x - Python 3.x required
        goto :try_python3
    )
) else (
    goto :try_python3
)
goto :start_server

:try_python3
python3 --version >nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON_CMD=python3
    echo. Found Python3
    goto :start_server
) else (
    echo. Python 3.x not found!
    echo Please install Python 3 to run this server.
    echo Download from: https://www.python.org/downloads/
    pause
    exit /b 1
)

:start_server

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
