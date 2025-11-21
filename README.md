# RootWork Lesson Plan Explainer

An interactive educational content player that guides you through an exceptional lesson plan, demonstrating best practices in pedagogy through synchronized **professional audio narration** and visual highlighting.

> **✨ Now featuring professional ElevenLabs AI narration!** Experience natural, engaging voice-over instead of robotic browser TTS.

## 🚀 Features

- **Professional Audio Narration**: 45 high-quality MP3 segments with natural-sounding AI voice (ElevenLabs)
- **Synchronized Highlighting**: Visual elements highlight in perfect sync with audio narration
- **Interactive Tour**: Comprehensive guided walkthrough through exceptional lesson plan
- **Seamless Playback**: Smooth transitions between segments with preloading
- **Full Navigation Controls**: Play/pause, previous/next, and direct section access
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Keyboard Shortcuts**: Navigate with arrow keys and spacebar
- **Zero Build Process**: Simple HTML5 and vanilla JavaScript

## 📋 Technical Specifications

### Audio
- **Format**: MP3 (MPEG-1 Audio Layer 3)
- **Total Segments**: 45 professional audio files
- **Total Duration**: ~15:30 minutes
- **Total Size**: ~9.6 MB
- **Bitrate**: 128 kbps
- **Quality**: Professional ElevenLabs AI voice

### Code
- **Main File**: index.html (~41.5 KB)
- **JavaScript**: Vanilla ES6+ (no frameworks)
- **Dependencies**: None (uses HTML5 Audio API)
- **Build Process**: None required
- **Browser Support**: All modern browsers with HTML5 audio support

## 🎯 Quick Start

### Option 1: Use Provided Server Scripts (Recommended)

**For Mac/Linux:**
```bash
./start-local-server.sh
```

**For Windows:**
```bash
start-local-server.bat
```

**For Python (Cross-platform):**
```bash
python3 start-local-server.py
```

Then open your browser to: http://localhost:8080

### Option 2: Manual Server Setup

```bash
# Using Python 3
python3 -m http.server 8080

# Using Node.js
npx http-server -p 8080

# Using PHP
php -S localhost:8080
```

> **⚠️ Note**: Do not open `index.html` directly with `file://` protocol. Audio files require a local server due to browser security policies.

## 🌐 Live Demo

Visit the GitHub Pages deployment:
```
https://SAHearn1.github.io/Lesson-plan-explainer/
```

## 🎮 Controls

- **Play Button**: Start the interactive audio tour
- **Pause/Resume**: Control playback at any time
- **Previous/Next Buttons**: Navigate between the 45 audio segments
- **Audio Toggle**: Mute/unmute audio while maintaining progression
- **Direct Section Navigation**: Click any section to jump directly to it
- **Keyboard Shortcuts**:
  - `→` Arrow Right: Next segment
  - `←` Arrow Left: Previous segment
  - `Space`: Play/Pause tour

## 📚 Content Structure

The lesson plan is divided into 45 audio segments covering 10 comprehensive sections:

1. **Relationships & Community Building** - Foundation for learning
2. **Learning Objectives & Success Criteria** - Clear goals and co-creation
3. **Direct Instruction & Modeling** - Gradual release model
4. **Active Learning & Application** - Differentiated practice
5. **Reflection & Metacognition** - Building self-awareness
6. **Assessment Strategy** - Multiple forms of evaluation
7. **Differentiation & Universal Design** - Access for all learners
8. **Extension & Enrichment** - Challenge for advanced learners
9. **Home Connection & Transfer** - Real-world application
10. **Appendix** - Why this lesson plan works

Each section includes detailed explanations narrated with professional audio quality, demonstrating why the pedagogical approach is exceptional.

## 🎨 Design Features

- **Professional Audio Narration**: Natural-sounding ElevenLabs AI voice throughout
- **Synchronized Highlighting**: Active sections highlighted with smooth animations
- **Audio Preloading**: Next segment preloads for seamless transitions
- **Progress Bar**: Visual indication of overall tour progress
- **Smooth Scrolling**: Automatic scroll to highlighted sections
- **Status Indicators**: Shows playing/paused state clearly
- **Accessible UI**: ARIA labels and full keyboard navigation

## 🔒 Security

- ✅ No `eval()` usage
- ✅ Uses `textContent` instead of `innerHTML` where appropriate
- ✅ No inline event handlers
- ✅ Audio files served from same origin
- ✅ No user input vulnerabilities
- ✅ HTML5 Audio API with proper error handling

## 📁 Repository Structure

```
Lesson-plan-explainer/
├── .github/
│   └── workflows/
│       └── deploy-pages.yml      # GitHub Pages deployment
├── audio/                         # Professional audio files
│   ├── README.md                  # Audio specifications
│   ├── segment-00.mp3             # Audio segments
│   ├── segment-01.mp3
│   └── ... (through segment-44.mp3)
├── index.html                     # Main application
├── audio-verification.html        # Audio testing tool
├── start-local-server.sh          # Mac/Linux server script
├── start-local-server.bat         # Windows server script
├── start-local-server.py          # Python server script
├── README.md                      # This file
├── UPGRADE-GUIDE.md               # Migration instructions
├── AUDIO-TROUBLESHOOTING.md       # Audio debugging guide
├── DEPLOYMENT-GUIDE.md            # GitHub Pages setup
├── TESTING-CHECKLIST.md           # QA procedures
└── FIX-APPLIED-READ-FIRST.md      # Audio version details
```

## 🧪 Testing

### Audio Verification
Use the included verification tool to test all audio files:

```bash
# Start local server
./start-local-server.sh

# Open in browser
open http://localhost:8080/audio-verification.html
```

The tool will:
- Test all 45 audio segments
- Report loading status for each file
- Identify any missing or broken files
- Provide detailed error information

### Manual Testing
Follow the comprehensive testing checklist in [TESTING-CHECKLIST.md](TESTING-CHECKLIST.md)

## 🚀 Deployment

### GitHub Pages (Recommended)

This repository is configured for automatic GitHub Pages deployment:

1. Push to `main` branch
2. GitHub Actions automatically deploys
3. Site available at: https://SAHearn1.github.io/Lesson-plan-explainer/

See [DEPLOYMENT-GUIDE.md](DEPLOYMENT-GUIDE.md) for detailed instructions.

### Other Hosting
The application can be hosted on any static web host:
- Netlify
- Vercel
- AWS S3 + CloudFront
- Any web server with static file serving

## 🔧 Troubleshooting

### Audio Not Playing?
1. Check browser console for errors (F12)
2. Verify local server is running (not using `file://`)
3. Test with audio verification tool
4. See [AUDIO-TROUBLESHOOTING.md](AUDIO-TROUBLESHOOTING.md)

### 404 Errors on Audio Files?
1. Verify `audio/` folder contains all 45 MP3 files
2. Check file naming: `segment-00.mp3` through `segment-44.mp3`
3. Ensure files are committed to git: `git ls-files audio/`
4. Check GitHub Actions deployment logs

### Need to Update to Audio Version?
See [UPGRADE-GUIDE.md](UPGRADE-GUIDE.md) for complete migration instructions from browser TTS to professional audio.

## 📚 Documentation

- **[UPGRADE-GUIDE.md](UPGRADE-GUIDE.md)** - How to update from browser TTS version
- **[AUDIO-TROUBLESHOOTING.md](AUDIO-TROUBLESHOOTING.md)** - Debug audio issues
- **[DEPLOYMENT-GUIDE.md](DEPLOYMENT-GUIDE.md)** - Deploy to GitHub Pages
- **[TESTING-CHECKLIST.md](TESTING-CHECKLIST.md)** - Comprehensive testing guide
- **[FIX-APPLIED-READ-FIRST.md](FIX-APPLIED-READ-FIRST.md)** - Professional audio details

## 🎓 Educational Value

This project demonstrates:
- **Best Practices in Pedagogy**: Exemplary lesson plan structure
- **Professional Audio in Education**: Impact of quality narration
- **Interactive Learning Design**: Engaging educational experiences
- **Accessible Web Applications**: Keyboard navigation and screen reader support
- **Static Site Architecture**: Simple, efficient, maintainable code

## 📝 License

This project is created as an educational demonstration.
