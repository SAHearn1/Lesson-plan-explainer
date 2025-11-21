#!/usr/bin/env python3
"""
Local Server Startup Script
This script starts a local HTTP server to test the lesson plan explainer with audio
"""

import http.server
import socketserver
import os
import sys
import errno
import webbrowser
from pathlib import Path

PORT = 8080
DIRECTORY = Path(__file__).parent

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    """Custom HTTP request handler with improved logging"""
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(DIRECTORY), **kwargs)
    
    def log_message(self, format, *args):
        """Override to provide cleaner log messages"""
        sys.stdout.write("%s - - [%s] %s\n" %
                        (self.address_string(),
                         self.log_date_time_string(),
                         format % args))

def main():
    print("=" * 50)
    print("RootWork Lesson Plan Explainer")
    print("Local Server Startup Script")
    print("=" * 50)
    print()
    
    # Check if index.html exists
    index_file = DIRECTORY / "index.html"
    if not index_file.exists():
        print("⚠ Warning: index.html not found in current directory")
        print(f"  Looking in: {DIRECTORY}")
        print()
    
    # Check if audio directory exists
    audio_dir = DIRECTORY / "audio"
    if not audio_dir.exists():
        print("⚠ Warning: audio/ directory not found")
        print("  Audio files may not load correctly")
        print()
    else:
        # Count audio files
        mp3_files = list(audio_dir.glob("*.mp3"))
        if mp3_files:
            print(f"✓ Found {len(mp3_files)} audio file(s) in audio/ directory")
        else:
            print("⚠ Warning: No MP3 files found in audio/ directory")
        print()
    
    # Start server
    try:
        with socketserver.TCPServer(("", PORT), CustomHTTPRequestHandler) as httpd:
            server_url = f"http://localhost:{PORT}"
            print(f"Starting local HTTP server...")
            print(f"Server URL: {server_url}")
            print()
            print("To test the application:")
            print(f"1. Open your browser to: {server_url}")
            print("2. Click the Play button")
            print("3. Verify audio plays correctly")
            print()
            print("Press Ctrl+C to stop the server")
            print("=" * 50)
            print()
            
            # Optionally open browser automatically
            # webbrowser.open(server_url)
            
            httpd.serve_forever()
            
    except KeyboardInterrupt:
        print("\n")
        print("=" * 50)
        print("Server stopped by user")
        print("=" * 50)
        sys.exit(0)
    except OSError as e:
        if e.errno == errno.EADDRINUSE:  # Address already in use
            print(f"\n✗ Error: Port {PORT} is already in use")
            print(f"  Try closing other applications using port {PORT}")
            print(f"  Or change PORT in this script to a different value")
        else:
            print(f"\n✗ Error starting server: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
