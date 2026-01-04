# MultiStopwatches

A lightweight Web App built with Flutter that lets you run multiple stopwatches simultaneously. Perfect for interval training, time tracking, or any scenario where you need to monitor multiple timers at once.

**Live App:** [multistopwatches.app](https://multistopwatches.app)

## Getting Started

### Web Access
Simply visit [multistopwatches.app](https://multistopwatches.app) in your browser and start using the app immediately.

### Install as PWA
For the best experience, install the app on your device:

**On Mobile (iOS/Android):**
1. Open [multistopwatches.app](https://multistopwatches.app) in your browser
2. **iOS (Safari):** Tap the Share button, then "Add to Home Screen"
3. **Android (Chrome):** Tap the menu (⋮), then "Add to Home Screen" or "Install App"

**On Desktop:**
1. Open [multistopwatches.app](https://multistopwatches.app) in Chrome, Edge, or other supported browser
2. Look for the install icon in the address bar or browser menu
3. Click "Install" to add the app to your applications

Once installed, the app works offline and launches like a native application.

## Features

- **Multiple Stopwatches**: Run as many stopwatches as you need in parallel
- **History Tracking**: Save and review past stopwatch recordings
- **CSV Export**: Export your time recordings to CSV for analysis
- **Groups**: Organize stopwatches into custom groups
- **Offline Support**: Works completely offline once installed
- **Cross-Platform**: Available on web, mobile, and desktop

## Platform Support

- Web browsers (Chrome, Safari, Firefox, Edge)
- Android (installable as PWA)
- iOS (installable via Safari)
- Desktop (Windows, Mac, Linux)

## Privacy

All data is stored locally in your browser using localStorage. No data is sent to any server, and your recordings remain completely private on your device.

## Planned Features

The following enhancements are planned for future releases:

- [ ] **Font Size Customization**: Adjustable font sizes for stopwatch display via settings slider
- [ ] **Keyboard Shortcuts**: Advanced feature for web/desktop users to control stopwatches with customizable keyboard shortcuts (space for start all, custom keys for individual stopwatch control)
- [ ] **Help Center**: Comprehensive help page with FAQ and information cards
- [ ] **Performance Optimizations**: Enhanced live update rendering using AnimationWidgets and Listeners
- [ ] **Donation Support**: Add a way for users to support the project
- [ ] **German SEO**: Localized search engine optimization for German-speaking users

## Technology

Built with Flutter for web deployment. Hosted on Vercel.

## Development Disclosure

The core application, including all features, UI/UX design, state management, and business logic, was developed independently by me without AI assistance in 2024 and earlier. In late 2025, AI tools (Claude) were used for some tasks:

- Migrating the app from Android-only to web deployment
- Resolving Flutter framework and package compatibility issues after version updates
- Implementing localization support
- Adding dark mode support
- Checking code for potential performance issues and suggesting optimizations

The fundamental architecture, feature implementation, and the majority of the codebase represent my independent work.
