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
    
    # Verify Python 3.x
    PYTHON_MAJOR_VERSION=$(python3 -c 'import sys; print(sys.version_info.major)')
    if [ "$PYTHON_MAJOR_VERSION" -lt 3 ]; then
        echo "✗ Python 3.x required (found Python $PYTHON_MAJOR_VERSION)"
        exit 1
    fi
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
    PYTHON_VERSION=$(python --version 2>&1)
    echo "✓ Found: $PYTHON_VERSION"
    
    # Verify Python 3.x
    PYTHON_MAJOR_VERSION=$(python -c 'import sys; print(sys.version_info.major)' 2>&1)
    if [ "$PYTHON_MAJOR_VERSION" -lt 3 ]; then
        echo "✗ Python 3.x required (found Python $PYTHON_MAJOR_VERSION)"
        echo "Please install Python 3 or use python3 command"
        exit 1
    fi
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
