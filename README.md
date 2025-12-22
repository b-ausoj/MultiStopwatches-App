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

### Step 2: Build Your Flutter App Locally

```bash
# Build the web app
flutter build web --release --base-href /
```

This creates optimized production files in the `build/web` directory.

### Step 3: Deploy to Vercel

**Option A: Using Vercel CLI (Recommended for Flutter)**

```bash
# Install Vercel CLI (one-time setup)
npm install -g vercel

# Login to Vercel (one-time setup)
vercel login

# Navigate to the build directory
cd build/web

# Deploy to Vercel
vercel --prod
```

Follow the prompts:
- Set up and deploy? **Y**
- Which scope? Select your account
- Link to existing project? **N** (first time) or **Y** (subsequent deploys)
- Project name? Enter a name (e.g., `multistopwatches`)
- Directory? Press Enter (it's already in build/web)

**Option B: Deploy via Vercel Dashboard**

1. Build your app: `flutter build web --release --base-href /`
2. Go to https://vercel.com and sign in
3. Click "Add New Project"
4. Click "Deploy without Git"
5. Drag and drop the `build/web` folder
6. Click "Deploy"

**Note for Future Updates:**

After making changes to your code:
1. Build again: `flutter build web --release --base-href /`
2. Deploy: `cd build/web && vercel --prod`

### Step 4: Configure Custom Domain (Optional)

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
