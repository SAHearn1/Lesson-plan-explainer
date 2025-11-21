# Audio Files

This directory contains professional audio narration files generated using ElevenLabs.

## File Structure

The audio files should be named sequentially:
- `segment-00.mp3` through `segment-44.mp3` (45 files total)

## File Specifications

- **Format:** MP3
- **Total Files:** 45 segments
- **Individual File Size:** ~200-500 KB each
- **Total Size:** ~9.6 MB
- **Total Runtime:** ~15:30 minutes
- **Bitrate:** Optimized for web delivery
- **Sample Rate:** 44.1 kHz or 48 kHz

## Adding Audio Files

To add your audio files to this repository:

1. Place all 45 MP3 files in this directory
2. Ensure files are named: `segment-00.mp3`, `segment-01.mp3`, ..., `segment-44.mp3`
3. Verify file sizes are under 1 MB each (GitHub limit is 100 MB per file)
4. Add files to git: `git add audio/*.mp3`
5. Commit: `git commit -m "Add professional audio files"`
6. Push: `git push origin main`

## Verifying Audio Files

Use the included `audio-verification.html` tool to verify:
- All 45 files are present
- Files can be loaded successfully
- Audio plays correctly
- No 404 errors

## Troubleshooting

### Audio files not loading
- Check that file names match exactly (case-sensitive)
- Verify files are committed to git: `git ls-files audio/`
- Check GitHub Pages deployment logs
- Test direct URL: `https://yourusername.github.io/repo-name/audio/segment-00.mp3`

### Files not tracked by Git
```bash
# Ensure audio files are tracked
git add audio/*.mp3
git status
```

### Large File Warning
If you get a warning about large files:
- Check individual file sizes: `ls -lh audio/`
- Each file should be under 1 MB
- If files are too large, re-encode with lower bitrate

## Content Mapping

Each audio segment corresponds to a specific section of the lesson plan:

- **segment-00.mp3:** Introduction
- **segment-01-04.mp3:** Relationships & Community Building
- **segment-05-08.mp3:** Learning Objectives & Success Criteria
- **segment-09-12.mp3:** Direct Instruction & Modeling
- **segment-13-16.mp3:** Active Learning & Application
- **segment-17-20.mp3:** Reflection & Metacognition
- **segment-21-24.mp3:** Assessment Strategy
- **segment-25-28.mp3:** Differentiation & Universal Design
- **segment-29-32.mp3:** Extension & Enrichment
- **segment-33-36.mp3:** Home Connection & Transfer
- **segment-37-40.mp3:** Appendix - Why this works
- **segment-41-44.mp3:** Conclusion

## License

Audio files should be properly licensed. If using ElevenLabs or other AI voice generation services, ensure compliance with their terms of service.
