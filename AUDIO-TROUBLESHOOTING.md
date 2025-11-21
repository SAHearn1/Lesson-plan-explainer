# Audio Troubleshooting Guide

This guide helps you diagnose and fix common audio-related issues with the RootWork Lesson Plan Explainer.

## 🔍 Quick Diagnostics

### Is the audio playing at all?

**Test 1: Check Browser Console**
1. Open your browser's Developer Tools (F12)
2. Go to the Console tab
3. Reload the page
4. Look for error messages related to audio files

**Test 2: Direct Audio File Access**
Try accessing an audio file directly:
- Local: `http://localhost:8080/audio/segment-00.mp3`
- GitHub Pages: `https://yourusername.github.io/repo-name/audio/segment-00.mp3`

If you get a 404 error, the audio files aren't being served correctly.

### Is the audio loading but not playing?

**Test 3: Browser Audio Permissions**
- Check if your browser has blocked autoplay
- Some browsers require user interaction before playing audio
- Try clicking the Play button explicitly

**Test 4: Audio Format Support**
- All modern browsers support MP3
- Check browser console for codec errors

## 🐛 Common Issues and Solutions

### Issue 1: 404 Errors on Audio Files

**Symptoms:**
- Browser console shows 404 errors
- Audio files not found
- Page loads but no sound

**Causes:**
1. Audio files not committed to repository
2. Incorrect file paths in HTML
3. Case sensitivity mismatch
4. Files in .gitignore

**Solutions:**

```bash
# Check if audio files are tracked by git
git ls-files audio/

# Should list all 45 MP3 files
# If empty, files aren't tracked

# Add audio files
git add audio/*.mp3
git status
git commit -m "Add audio files"
git push origin main
```

**Check .gitignore:**
```bash
# Make sure audio files aren't ignored
cat .gitignore

# If audio/ or *.mp3 is listed, remove it
# Edit .gitignore and commit the change
```

### Issue 2: Audio Files Too Large

**Symptoms:**
- Git warns about large files
- Push fails
- Files over 100 MB rejected by GitHub

**Solution:**
```bash
# Check file sizes
ls -lh audio/

# Each file should be under 1 MB
# If files are larger, re-encode them

# Using ffmpeg to reduce file size:
for file in audio/*.mp3; do
    ffmpeg -i "$file" -b:a 128k "${file%.mp3}_compressed.mp3"
done
```

### Issue 3: Audio Not Loading on GitHub Pages

**Symptoms:**
- Works locally but not on GitHub Pages
- 404 errors only on deployed site
- Files show in repository but don't load

**Solutions:**

**Check GitHub Actions:**
1. Go to repository → Actions tab
2. Check latest workflow run
3. Look for errors in deployment

**Verify Pages Configuration:**
1. Go to Settings → Pages
2. Source should be "GitHub Actions"
3. Check the deployment URL

**Wait for Deployment:**
- GitHub Pages can take 2-5 minutes to update
- Check "pages build and deployment" workflow
- Clear browser cache and try again

### Issue 4: CORS Errors

**Symptoms:**
- Console shows CORS errors
- Audio blocked by CORS policy
- Works on some domains but not others

**Solution:**
For local testing, use the provided server scripts:
- `start-local-server.sh` (Mac/Linux)
- `start-local-server.bat` (Windows)
- `start-local-server.py` (Python)

Don't open HTML files directly with `file://` protocol - use a local server.

### Issue 5: Autoplay Blocked by Browser

**Symptoms:**
- Audio doesn't start automatically
- Console shows "autoplay blocked" message
- Must click play button multiple times

**Solution:**

Browser autoplay policies require user interaction. The application handles this by:
1. Waiting for user to click "Play" button
2. Only then starting audio playback
3. Subsequent segments play automatically

**User Action Required:**
- Users must click the Play button
- This is browser security policy, not a bug

**For Development:**
- In Chrome: chrome://settings/content/sound
- Enable sound for localhost
- Note: This doesn't help end users

### Issue 6: Audio Cuts Off or Stutters

**Symptoms:**
- Audio starts but stops mid-sentence
- Stuttering or buffering issues
- Playback is choppy

**Causes:**
1. Slow internet connection
2. Files too large
3. Server issues

**Solutions:**

**Check File Sizes:**
```bash
ls -lh audio/
# Files should be 200-500 KB each
```

**Test Network Speed:**
- Open browser Network tab (F12 → Network)
- Filter by "Media" or "MP3"
- Check download times
- Should be under 1 second per file

**Preload Audio:**
The application should preload the next segment. Check if preloading is working:
```javascript
// In browser console:
document.querySelectorAll('audio').forEach(audio => {
    console.log(audio.src, audio.readyState);
});
```

### Issue 7: Audio Out of Sync with Highlights

**Symptoms:**
- Audio plays but highlighting is wrong
- Sections highlighted don't match narration
- Timing is off

**Solution:**

Check that segment timing in the HTML matches audio files:
1. Open `index.html`
2. Find the `segments` array in JavaScript
3. Verify each segment's duration matches the audio file
4. Adjust timing if needed

Example:
```javascript
{
    id: 0,
    title: "Introduction",
    duration: 15.5,  // Should match segment-00.mp3 duration
    audioFile: "audio/segment-00.mp3"
}
```

### Issue 8: Some Audio Files Work, Others Don't

**Symptoms:**
- First few segments play fine
- Later segments fail to load
- Random segments missing

**Solution:**

**Check File Naming:**
```bash
# List all audio files
ls audio/

# Should show:
# segment-00.mp3
# segment-01.mp3
# ...
# segment-44.mp3

# Check for typos:
# - Wrong numbering (segment-1.mp3 instead of segment-01.mp3)
# - Wrong case (Segment-00.mp3)
# - Wrong extension (segment-00.MP3)
```

**Verify All Files Present:**
```bash
# Should have exactly 45 files
ls audio/*.mp3 | wc -l

# If less than 45, find which are missing:
for i in {00..44}; do
    if [ ! -f "audio/segment-$i.mp3" ]; then
        echo "Missing: segment-$i.mp3"
    fi
done
```

## 🔧 Advanced Debugging

### Enable Verbose Logging

Add this to your browser console:
```javascript
// Enable audio debugging
const originalAudio = Audio;
window.Audio = function() {
    const audio = new originalAudio();
    console.log('Created audio element:', audio.src);
    
    audio.addEventListener('loadstart', () => console.log('Loading:', audio.src));
    audio.addEventListener('canplay', () => console.log('Can play:', audio.src));
    audio.addEventListener('error', (e) => console.error('Error:', audio.src, e));
    
    return audio;
};
```

### Test All Audio Files

Use the included `audio-verification.html` tool:
1. Open `audio-verification.html` in your browser
2. It will test all 45 audio files
3. Shows which files load successfully
4. Reports any errors

### Check HTTP Headers

```bash
# Check if files are being served with correct MIME type
curl -I http://localhost:8080/audio/segment-00.mp3

# Should show:
# Content-Type: audio/mpeg
```

### Network Throttling Test

1. Open DevTools → Network tab
2. Enable network throttling (Slow 3G)
3. Reload and test audio playback
4. Verify buffering behavior

## 📊 Audio File Specifications

All audio files should meet these specifications:

- **Format:** MP3 (MPEG-1 Audio Layer 3)
- **Codec:** MP3
- **Bitrate:** 128 kbps (recommended)
- **Sample Rate:** 44.1 kHz or 48 kHz
- **Channels:** Stereo or Mono
- **File Size:** 200-500 KB per file
- **Total Size:** ~9.6 MB for all 45 files

### Verifying Audio Specifications

```bash
# Using ffprobe (part of ffmpeg)
ffprobe -i audio/segment-00.mp3 -show_format -show_streams

# Check bitrate, duration, codec
```

## 🆘 Still Having Issues?

If you've tried all the above and audio still isn't working:

1. **Check Browser Compatibility:**
   - Test in Chrome, Firefox, Safari
   - Update to latest browser version
   - Try incognito/private mode

2. **Verify File Integrity:**
   - Try playing MP3 files in a media player
   - Ensure files aren't corrupted
   - Re-download or regenerate if needed

3. **Check GitHub Repository:**
   - Verify files show in GitHub repository web interface
   - Check file sizes in GitHub
   - Ensure deployment workflow succeeded

4. **Test Locally First:**
   - Always test locally before deploying
   - Use provided server scripts
   - Verify everything works locally

5. **Review Documentation:**
   - [DEPLOYMENT-GUIDE.md](DEPLOYMENT-GUIDE.md)
   - [TESTING-CHECKLIST.md](TESTING-CHECKLIST.md)
   - [UPGRADE-GUIDE.md](UPGRADE-GUIDE.md)

## 📝 Reporting Issues

When reporting audio issues, please include:
- Browser and version
- Operating system
- Whether issue occurs locally or on GitHub Pages
- Browser console errors
- Network tab showing audio file requests
- Whether audio files play in media player
- Steps to reproduce the issue
