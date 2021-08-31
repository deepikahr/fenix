# Pilarbox
Pilarbox
## Getting Started

### Create `.env` file in root folder

Add these following in env variable 
```
API_URL=
ONE_SIGNAL_KEY=
STRIPE_KEY=
IMAGE_URL_PATH=
ANDROID_GOOGLE_MAP_API_KEY=
IOS_GOOGLE_MAP_API_KEY=
PREDEFINED=
```
### to generate new icons for android and ios.

replace new images on lib/assets/logo.png (1024px*1024px)  and run following commands.
```
cp lib/assets/logo.png ios/Runner/Assets.xcassets/AppIcon.appiconset/ItunesArtwork@2x.png
flutter packages pub get
flutter pub run flutter_launcher_icons:main
```