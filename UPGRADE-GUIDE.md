# Upgrade Guide: Professional Audio Version

This guide walks you through updating your existing GitHub repository to use the professional ElevenLabs audio version.

## 📋 What's Changing

### Removing (Old Version):
- ❌ index.html (simple single-file with browser TTS)
- ❌ Old content structure (11 sections)

### Adding (New Professional Version):
- ✅ rootwork-lesson-explainer.html or index.html (updated)
- ✅ audio/ folder with 45 professional MP3 files
- ✅ Server testing scripts (.bat, .sh, .py)
- ✅ Comprehensive documentation files
- ✅ Audio verification tool
- ✅ Updated GitHub Actions workflow

## 🚀 Step-by-Step Update Process

### Step 1: Backup Current Repository

```bash
# Clone your current repository
git clone https://github.com/SAHearn1/Lesson-plan-explainer.git
cd Lesson-plan-explainer

# Create backup branch
git checkout -b backup-old-version
git push origin backup-old-version

# Return to main
git checkout main
```

### Step 2: Download Updated Package

Download the complete rootwork-explainer folder with all 45 audio files.

### Step 3: Update Repository Files

#### Option A: Complete Replacement (Recommended)

```bash
# Remove old files (keeping .git folder and .github folder)
# Keep: .git/, .github/, .gitignore (if you have one)
# Delete everything else

# Copy all new files from rootwork-explainer package
cp -r /path/to/rootwork-explainer/* .

# Rename if needed (for GitHub Pages default)
# If your repo expects index.html at root:
mv rootwork-lesson-explainer.html index.html
```

#### Option B: Selective Update

```bash
# Update main HTML file
rm index.html  # or your old HTML file
cp /path/to/rootwork-explainer/rootwork-lesson-explainer.html index.html

# Add audio folder
cp -r /path/to/rootwork-explainer/audio .

# Add server scripts
cp /path/to/rootwork-explainer/start-local-server.* .

# Add documentation
cp /path/to/rootwork-explainer/*.md .

# Add verification tool
cp /path/to/rootwork-explainer/audio-verification.html .
```

### Step 4: Update GitHub Actions Workflow

```bash
# Replace workflow file
cp /path/to/updated/deploy-pages.yml .github/workflows/deploy-pages.yml
```

Or manually update `.github/workflows/deploy-pages.yml` with the version provided.

### Step 5: Update README

```bash
# Replace README
cp /path/to/updated/README.md .
```

**Important:** Update these placeholders in README.md:
- Replace `your-repo-name` with actual repository name
- Replace `your-username` with your GitHub username
- Update any specific URLs or contact information

### Step 6: Commit and Push

```bash
# Stage all changes
git add .

# Commit with descriptive message
git commit -m "Update to professional audio version with 45 ElevenLabs segments

- Replace browser TTS with professional audio narration
- Add 45 MP3 audio segments (9.6 MB)
- Update HTML with improved audio playback
- Add local testing server scripts
- Include comprehensive documentation
- Update GitHub Actions workflow for audio deployment
- Add audio verification tool

Total package: ~10 MB, 15:30 min runtime"

# Push to GitHub
git push origin main
```

### Step 7: Verify GitHub Pages Deployment

1. **Check Actions Tab:**
   - Go to your repository on GitHub
   - Click "Actions" tab
   - Watch the deployment workflow run
   - Should complete in 1-2 minutes

2. **Enable GitHub Pages (if not already enabled):**
   - Go to Settings → Pages
   - Source: Select "GitHub Actions"
   - Save

3. **Wait for Deployment:**
   - Usually takes 2-5 minutes after workflow completes
   - Check the Actions tab for "pages build and deployment" status

4. **Test Your Site:**
   - Visit: https://SAHearn1.github.io/Lesson-plan-explainer/
   - Click Play button
   - Verify audio plays correctly
   - Test on mobile device

## ✅ Verification Checklist

After deployment, verify:

- [ ] GitHub Pages site loads successfully
- [ ] Main HTML displays correctly with all styling
- [ ] Play button starts presentation
- [ ] Audio plays automatically (professional voice, not robotic)
- [ ] Visual highlighting synchronizes with audio
- [ ] Previous/Next buttons work
- [ ] Audio toggle works
- [ ] Auto-advance between segments works
- [ ] Progress bar updates correctly
- [ ] All 45 segments play through completely
- [ ] Works on mobile device
- [ ] No 404 errors in browser console (F12)

## 📊 File Structure After Update

```
Lesson-plan-explainer/
├── .git/                          # Git version control
├── .github/
│   └── workflows/
│       └── deploy-pages.yml       # Updated workflow
├── audio/                          # NEW - Professional audio
│   ├── segment-00.mp3
│   ├── segment-01.mp3
│   └── ... (through segment-44.mp3)
├── index.html                      # Updated main file
├── audio-verification.html         # NEW - Testing tool
├── start-local-server.bat          # NEW - Windows script
├── start-local-server.sh           # NEW - Mac/Linux script
├── start-local-server.py           # NEW - Python script
├── README.md                       # Updated documentation
├── AUDIO-TROUBLESHOOTING.md        # NEW - Audio guide
├── DEPLOYMENT-GUIDE.md             # NEW - Setup guide
├── TESTING-CHECKLIST.md            # NEW - QA procedures
└── FIX-APPLIED-READ-FIRST.md       # NEW - Audio fix explanation
```

## 🔧 Troubleshooting

### Deployment Fails in GitHub Actions

**Check:**
- All audio files committed and pushed (check `git status`)
- Audio folder not in `.gitignore`
- Total repository size under 1 GB
- No binary file errors in git

**Solution:**
```bash
# Verify audio files tracked by git
git ls-files audio/

# Should list all 45 MP3 files
# If empty, audio files not tracked

# Add audio files explicitly
git add audio/*.mp3
git commit -m "Add audio files"
git push origin main
```

### Audio Files Not Deploying

GitHub has a 100 MB file size limit per file.

Check individual audio file sizes:
```bash
ls -lh audio/

# Each file should be under 1 MB
# If any file is over 100 MB, it won't upload
```

Our audio files are all under 500 KB, so this shouldn't be an issue.

### Site Loads But No Audio

**Check browser console (F12):**
- Look for 404 errors on audio files
- Verify paths are correct (audio/segment-XX.mp3)
- Check file names match exactly (case-sensitive)

**Verify files deployed:**
- Visit: https://SAHearn1.github.io/Lesson-plan-explainer/audio/segment-00.mp3
- Should download or play the audio file
- If 404, files didn't deploy correctly

## 📚 Additional Resources

- [AUDIO-TROUBLESHOOTING.md](AUDIO-TROUBLESHOOTING.md) - Detailed audio debugging guide
- [DEPLOYMENT-GUIDE.md](DEPLOYMENT-GUIDE.md) - Complete deployment instructions
- [TESTING-CHECKLIST.md](TESTING-CHECKLIST.md) - QA testing procedures
- [FIX-APPLIED-READ-FIRST.md](FIX-APPLIED-READ-FIRST.md) - Audio fix explanation

## 🆘 Getting Help

If you encounter issues not covered in this guide:
1. Check the troubleshooting section above
2. Review the additional documentation files
3. Check GitHub Actions logs for detailed error messages
4. Verify all audio files are present and correctly named
