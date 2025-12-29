@echo off
echo Building Flutter Web Release...
flutter build web --release --dart-define=CONTACT_EMAIL=josua.bu@gmail.com
echo Build complete!
