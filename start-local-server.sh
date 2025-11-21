#!/bin/bash
# Local Server Startup Script for Mac/Linux
# This script starts a local HTTP server to test the lesson plan explainer with audio

echo "=========================================="
echo "RootWork Lesson Plan Explainer"
echo "Local Server Startup Script"
echo "=========================================="
echo ""

# Check if Python 3 is installed
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
    PYTHON_VERSION=$(python3 --version)
    echo "✓ Found: $PYTHON_VERSION"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
    PYTHON_VERSION=$(python --version)
    echo "✓ Found: $PYTHON_VERSION"
else
    echo "✗ Python not found!"
    echo "Please install Python 3 to run this server."
    exit 1
fi

echo ""
echo "Starting local HTTP server..."
echo "Server URL: http://localhost:8080"
echo ""
echo "To test the application:"
echo "1. Open your browser to: http://localhost:8080"
echo "2. Click the Play button"
echo "3. Verify audio plays correctly"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=========================================="
echo ""

# Start the server
$PYTHON_CMD -m http.server 8080
