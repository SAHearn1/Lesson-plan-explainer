# Deployment Guide

Complete guide for deploying the RootWork Lesson Plan Explainer to GitHub Pages.

## 📋 Prerequisites

Before deploying, ensure you have:

- [x] GitHub account
- [x] Git installed locally
- [x] Repository created on GitHub
- [x] All audio files (45 MP3 files)
- [x] Updated HTML file with audio player
- [x] Local testing completed successfully

## 🚀 Initial Setup

### 1. Create GitHub Repository

If you haven't already:

1. Go to [GitHub](https://github.com)
2. Click "New repository"
3. Name: `Lesson-plan-explainer` (or your preferred name)
4. Description: "Interactive lesson plan explainer with professional audio narration"
5. Choose Public or Private
6. Don't initialize with README (we'll push existing files)
7. Click "Create repository"

### 2. Configure Local Repository

```bash
# If starting fresh
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/Lesson-plan-explainer.git
git push -u origin main

# If updating existing repository
cd Lesson-plan-explainer
git status
git add .
git commit -m "Update to professional audio version"
git push origin main
```

### 3. Enable GitHub Pages

**Method 1: Using GitHub Actions (Recommended)**

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll to **Pages** section (left sidebar)
4. Under **Source**, select **GitHub Actions**
5. Click **Save**

**Method 2: Using Branch**

1. Go to **Settings** → **Pages**
2. Under **Source**, select **Deploy from a branch**
3. Select branch: **main**
4. Select folder: **/ (root)**
5. Click **Save**

## 📦 Deployment Process

### Step 1: Prepare Files

Ensure your repository has this structure:

```
Lesson-plan-explainer/
├── .github/
│   └── workflows/
│       └── deploy-pages.yml
├── audio/
│   ├── segment-00.mp3
│   ├── segment-01.mp3
│   └── ... (through segment-44.mp3)
├── index.html
├── audio-verification.html
├── start-local-server.sh
├── start-local-server.bat
├── start-local-server.py
├── README.md
├── AUDIO-TROUBLESHOOTING.md
├── DEPLOYMENT-GUIDE.md
├── TESTING-CHECKLIST.md
└── UPGRADE-GUIDE.md
```

### Step 2: Verify GitHub Actions Workflow

Your `.github/workflows/deploy-pages.yml` should look like this:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v4
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Step 3: Commit and Push

```bash
# Check status
git status

# Stage all files
git add .

# Commit with descriptive message
git commit -m "Deploy professional audio version

- Add 45 ElevenLabs audio segments
- Update HTML with audio player
- Include server testing scripts
- Add comprehensive documentation"

# Push to GitHub
git push origin main
```

### Step 4: Monitor Deployment

**Watch GitHub Actions:**

1. Go to your repository on GitHub
2. Click the **Actions** tab
3. You should see a workflow run starting
4. Click on the workflow to see detailed logs
5. Wait for all steps to complete (usually 1-2 minutes)

**Check for Errors:**

- Green checkmark ✓ = Success
- Red X ✗ = Failed
- Yellow circle = In progress

If deployment fails, check the error logs and fix issues.

### Step 5: Verify Deployment

**Get Your GitHub Pages URL:**

Your site will be available at:
```
https://YOUR_USERNAME.github.io/Lesson-plan-explainer/
```

Replace `YOUR_USERNAME` with your GitHub username.

**Test the Site:**

1. Open the URL in your browser
2. Page should load completely
3. Click the **Play** button
4. Audio should start playing
5. Visual highlighting should sync with audio
6. Test navigation buttons
7. Test on mobile device

## 🔍 Verification Checklist

After deployment, verify:

- [ ] GitHub Actions workflow completed successfully
- [ ] Pages build and deployment workflow succeeded
- [ ] Site loads at GitHub Pages URL
- [ ] No 404 errors in browser console
- [ ] Main HTML displays correctly
- [ ] All styling and CSS working
- [ ] Play button starts presentation
- [ ] Audio plays (professional voice, not robotic)
- [ ] Visual highlighting synchronized
- [ ] Previous/Next buttons work
- [ ] Audio toggle works
- [ ] Progress bar updates
- [ ] All 45 segments accessible
- [ ] Mobile responsive design works
- [ ] No console errors

## 🐛 Troubleshooting Deployment

### Issue: Workflow Fails to Start

**Check:**
- Workflow file is in `.github/workflows/` directory
- File is named with `.yml` or `.yaml` extension
- YAML syntax is valid (no tabs, proper indentation)

**Solution:**
```bash
# Validate YAML syntax online or with tool
yamllint .github/workflows/deploy-pages.yml
```

### Issue: Permission Denied Errors

**Error Message:**
```
Error: HttpError: Resource not accessible by integration
```

**Solution:**
1. Go to **Settings** → **Actions** → **General**
2. Scroll to **Workflow permissions**
3. Select **Read and write permissions**
4. Check **Allow GitHub Actions to create and approve pull requests**
5. Click **Save**

### Issue: Pages Not Deploying

**Check:**
- GitHub Pages enabled in Settings → Pages
- Source set to "GitHub Actions"
- Repository is Public or Pro/Team with Pages enabled

**Solution:**
1. Verify Settings → Pages configuration
2. Check Actions tab for deployment status
3. Wait 2-5 minutes for DNS propagation
4. Clear browser cache and try again

### Issue: 404 on Audio Files

**Check:**
```bash
# Verify audio files are in repository
git ls-files audio/

# Should list all 45 MP3 files
```

**Solution:**
```bash
# Add audio files if missing
git add audio/*.mp3
git commit -m "Add audio files"
git push origin main
```

### Issue: Large Files Rejected

**Error Message:**
```
remote: error: File audio/segment-XX.mp3 is 105.23 MB; this exceeds GitHub's file size limit of 100 MB
```

**Solution:**
```bash
# Check file sizes
ls -lh audio/

# Reduce file size using ffmpeg
ffmpeg -i audio/segment-XX.mp3 -b:a 128k audio/segment-XX_compressed.mp3

# Replace original
mv audio/segment-XX_compressed.mp3 audio/segment-XX.mp3

# Commit and push
git add audio/segment-XX.mp3
git commit -m "Compress audio file"
git push origin main
```

## 🔄 Updating After Initial Deployment

To update your deployed site:

```bash
# Make changes to files
# Test locally first

# Stage changes
git add .

# Commit
git commit -m "Update: description of changes"

# Push to trigger automatic redeployment
git push origin main

# GitHub Actions will automatically redeploy
```

## 🌐 Custom Domain (Optional)

To use a custom domain:

1. **Register domain** with provider (GoDaddy, Namecheap, etc.)

2. **Configure DNS:**
   - Add CNAME record pointing to: `YOUR_USERNAME.github.io`
   - Or A records for GitHub Pages IPs

3. **Update GitHub Settings:**
   - Go to Settings → Pages
   - Enter custom domain
   - Wait for DNS check to pass
   - Enable "Enforce HTTPS"

4. **Add CNAME file:**
```bash
echo "yourdomain.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push origin main
```

## 📊 Monitoring

### Check Deployment Status

```bash
# View recent deployments
gh api repos/YOUR_USERNAME/Lesson-plan-explainer/pages/builds

# Check Pages status
gh api repos/YOUR_USERNAME/Lesson-plan-explainer/pages
```

### Analytics (Optional)

Add Google Analytics or similar to track visitors:

1. Get tracking ID from analytics provider
2. Add tracking code to `index.html` before `</head>`
3. Commit and push changes

## 🔒 Security Considerations

### Repository Visibility

**Public Repository:**
- ✓ Free GitHub Pages
- ✓ Anyone can see code
- ✗ Anyone can see audio files

**Private Repository:**
- ✓ Code is private
- ✗ Requires GitHub Pro/Team for Pages
- ✗ Audio files still public when deployed

### Audio File Protection

GitHub Pages cannot password-protect files. All deployed files are publicly accessible.

If you need to protect audio files:
- Use a different hosting solution
- Implement authentication
- Use a CDN with access controls

## 📝 Deployment Checklist

Before deploying:

- [ ] All audio files present and tested
- [ ] HTML file updated and validated
- [ ] Local testing completed successfully
- [ ] Documentation updated
- [ ] README.md updated with correct URLs
- [ ] .gitignore configured properly
- [ ] GitHub Actions workflow file present
- [ ] Repository settings configured
- [ ] GitHub Pages enabled
- [ ] All files committed and pushed

## 🆘 Getting Help

If you encounter issues:

1. Check [AUDIO-TROUBLESHOOTING.md](AUDIO-TROUBLESHOOTING.md)
2. Review GitHub Actions logs
3. Check browser console for errors
4. Test locally with provided server scripts
5. Verify all files are committed: `git status`
6. Check GitHub Pages status in repository settings

## 📚 Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [TESTING-CHECKLIST.md](TESTING-CHECKLIST.md) - QA procedures
- [UPGRADE-GUIDE.md](UPGRADE-GUIDE.md) - Migration guide
