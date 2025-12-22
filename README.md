# MultiStopwatches

A Progressive Web App (PWA) for running multiple stopwatches simultaneously with history tracking and CSV export capabilities.

## Features

- Run multiple stopwatches in parallel
- Save and view stopwatch recordings
- Export recordings to CSV format
- Organize stopwatches into groups
- Works offline as a PWA
- Install on mobile devices (iOS/Android) and desktop

## Deployment to Vercel

This app is configured for easy deployment to Vercel. Follow these steps:

### Prerequisites

1. Install Git (if not already installed)
2. Create a GitHub account at https://github.com
3. Create a Vercel account at https://vercel.com (sign in with GitHub)

### Step 1: Push to GitHub

If you haven't already pushed this project to GitHub:

```bash
# Initialize git repository (if not already done)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit - PWA ready"

# Create a new repository on GitHub.com, then:
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

### Step 2: Deploy to Vercel

**Option A: Using Vercel Dashboard (Easiest)**

1. Go to https://vercel.com and sign in with your GitHub account
2. Click "Add New Project"
3. Import your GitHub repository
4. Vercel will auto-detect the settings from `vercel.json`
5. Click "Deploy"
6. Wait for the build to complete (first build may take 5-10 minutes)
7. Your app will be live at `https://your-project-name.vercel.app`

**Option B: Using Vercel CLI**

```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel

# For production deployment
vercel --prod
```

### Step 3: Configure Custom Domain (Optional)

1. In your Vercel project dashboard, go to "Settings" > "Domains"
2. Add your custom domain
3. Follow the DNS configuration instructions

## Local Development

### Build for Web

```bash
flutter build web --release
```

### Run Locally

```bash
flutter run -d chrome
```

Or serve the built files:

```bash
cd build/web
python -m http.server 8000
```

Then open http://localhost:8000

## Platform Support

- Web (Chrome, Safari, Firefox, Edge)
- Android (via web browser or installed as PWA)
- iOS (via Safari or installed as PWA)
- Desktop (via web browser)

## Data Storage

- All data is stored locally using browser localStorage
- Data persists across sessions but is device-specific
- No server-side storage required
