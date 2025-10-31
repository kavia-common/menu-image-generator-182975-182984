# Setup Guide

This document explains how to configure and run the Menu Image Generator Flutter app, including environment variables, platform permissions, and troubleshooting.

## Prerequisites

- Flutter SDK installed and on PATH
- Android SDK/Xcode as appropriate for your target
- An OpenAI API key

## 1) Environment variables (.env)

Create a .env file in the app directory and add your developer-provided OpenAI API key:

```
OPENAI_API_KEY=sk-XXXXXXXXXXXXXXXXXXXXXXXX
```

Notes:
- The key is provided by developers; the app does not collect keys from end users.
- The app loads .env in main.dart using flutter_dotenv. If .env is missing, UI disables capture/import and shows a banner/snackbar.
- Never commit secrets to version control.

Relevant code:
- lib/main.dart loads .env.
- lib/config/config.dart reads OPENAI_API_KEY via flutter_dotenv.

## 2) Android permissions

Declared in Android manifests:
- CAMERA: Required to capture photos.
- READ_MEDIA_IMAGES: Required on Android 13+ (API 33+) for gallery access.
- READ_EXTERNAL_STORAGE (maxSdkVersion="32"): Used on Android 12 and below for legacy gallery access.
- INTERNET: Present in debug/profile manifests to support Flutter tooling (hot reload, etc.).

Runtime handling:
- The app requests permissions using permission_handler (see lib/services/camera_service.dart).

Files:
- android/app/src/main/AndroidManifest.xml (CAMERA, READ_MEDIA_IMAGES, READ_EXTERNAL_STORAGE)
- android/app/src/debug/AndroidManifest.xml (INTERNET, READ_MEDIA_IMAGES, READ_EXTERNAL_STORAGE)
- android/app/src/profile/AndroidManifest.xml (INTERNET, READ_MEDIA_IMAGES, READ_EXTERNAL_STORAGE)

## 3) iOS Info.plist keys

If/when you add an iOS target, include these keys in ios/Runner/Info.plist:
- NSCameraUsageDescription: “Capture a photo of the menu.”
- NSPhotoLibraryUsageDescription: “Select a menu photo from the library.” (needed for gallery pickers on some iOS versions)
- NSPhotoLibraryAddUsageDescription: Only if you add features that save images to the library.

The repository does not currently include an iOS project; add these once you generate ios/.

## 4) Run the app and previews

From the app directory:
```
cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter run
```

Optional:
```
flutter analyze
flutter test
```

Using helper scripts to avoid path issues:

From repository root:
```
./run_flutter_ci.sh pubget
./run_flutter_ci.sh analyze
./run_flutter_ci.sh test
./run_flutter_ci.sh run
```

From container root (menu-image-generator-182975-182984/):
```
./run_flutter_path_proxy.sh analyze
./run_flutter_path_proxy.sh test
./run_flutter_path_proxy.sh run
```

Ensure scripts are executable:
```
chmod +x run_flutter_ci.sh
chmod +x menu-image-generator-182975-182984/run_flutter_ci.sh
chmod +x menu-image-generator-182975-182984/run_flutter_path_proxy.sh
```

## 5) Privacy and security notes

- Do not log or print the OPENAI_API_KEY. The OpenAI service implementation uses friendly error messages without leaking secrets (see lib/services/openai_service.dart).
- The app does not exfiltrate user data. It sends necessary requests to OpenAI endpoints for OCR-like text extraction and image generation. Local run history is stored on-device using shared_preferences.
- Review logs for sensitive content before sharing.

## 6) Troubleshooting

- Flutter project root errors:
  - Always run commands from the app directory or use the helpers. The helpers read flutter_project_path.yaml and proxy into the correct path.
- After editing pubspec.yaml:
  - Run flutter pub get before building or running.
- API key not detected:
  - Ensure .env exists in the app directory and OPENAI_API_KEY is set. Restart the app after adding the file.
- Android gallery access across SDK versions:
  - Android 13+ requires READ_MEDIA_IMAGES. Pre-13 devices use READ_EXTERNAL_STORAGE (manifest includes maxSdkVersion="32").
