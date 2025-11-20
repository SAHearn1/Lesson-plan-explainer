# RootWork Lesson Plan Explainer

An interactive educational content player that guides you through an exceptional lesson plan, demonstrating best practices in pedagogy through synchronized narration and visual highlighting.

## 🚀 Features

- **Single-File Architecture**: Everything in one HTML file - no dependencies, no build process
- **Zero Dependencies**: Pure vanilla JavaScript (ES6+), inline CSS, and HTML5
- **Interactive Tour**: 11-step guided walkthrough with synchronized highlighting
- **Visual Highlighting**: Active sections are highlighted with smooth animations
- **Text-to-Speech**: Optional Web Speech API integration for audio narration
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Keyboard Shortcuts**: Navigate with arrow keys and spacebar

## 📋 Technical Specifications

- **File Size**: ~41.5 KB
- **CSS Lines**: ~377 lines (inline)
- **JavaScript**: Vanilla ES6+ (no frameworks)
- **External Dependencies**: None
- **Build Process**: None required
- **Browser Support**: Modern browsers with ES6+ support

## 🎯 Usage

Simply open `index.html` in any modern web browser. No installation, server, or build process required.

```bash
# Open directly in browser
open index.html  # macOS
xdg-open index.html  # Linux
start index.html  # Windows
```

Or serve with any HTTP server:
```bash
python3 -m http.server 8080
# Then visit http://localhost:8080
```

## 🎮 Controls

- **Start Tour Button**: Begin the interactive guided tour
- **Next/Previous Buttons**: Navigate between lesson plan sections
- **Pause/Resume**: Control the tour playback
- **TTS Toggle**: Enable/disable text-to-speech narration
- **Keyboard Shortcuts**:
  - `→` Arrow Right: Next section
  - `←` Arrow Left: Previous section
  - `Space`: Play/Pause tour

## 📚 Content Structure

The lesson plan covers 10 comprehensive sections:

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

Each section includes detailed explanations of why the pedagogical approach is exceptional.

## 🎨 Design Features

- **Color-Coded Highlighting**: Active sections get a warm yellow background
- **Smooth Scrolling**: Automatic scroll to highlighted sections
- **Progress Bar**: Visual indication of tour progress
- **Status Indicators**: Shows playing/paused state
- **Accessible UI**: ARIA labels and keyboard navigation

## 🔒 Security

- ✅ No `eval()` usage
- ✅ Uses `textContent` instead of `innerHTML`
- ✅ No inline event handlers
- ✅ No external scripts or resources
- ✅ No user input vulnerabilities

## 🤝 Contributing

This is a demonstration project showcasing best practices for:
- Single-file web applications
- Zero-dependency development
- Educational content presentation
- Accessible interactive design

## 📝 License

This project is created as an educational demonstration.
