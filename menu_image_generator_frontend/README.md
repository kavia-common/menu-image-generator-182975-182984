# Menu Image Generator — Frontend

This is a Flutter mobile app that captures a menu image, extracts dish names, and generates an image for each dish using OpenAI APIs. The app lives in a non-root path inside this repository.

## Project location

- App path: menu-image-generator-182975-182984/menu_image_generator_frontend

Automation helpers are provided to avoid “Could not determine project root directory for Flutter project” errors.

## Environment configuration (.env)

The app reads a developer-provided OpenAI API key from a .env file at runtime.

- Create menu-image-generator-182975-182984/menu_image_generator_frontend/.env
- Add your key:
  OPENAI_API_KEY=sk-XXXXXXXXXXXXXXXXXXXXXXXX

Notes:
- The API key is developer-provided. The app does not collect or transmit keys from users.
- Never commit secrets to version control.
- The app loads .env in main.dart using flutter_dotenv. If .env is missing, features that require OpenAI are disabled and a banner/snackbar will explain that a key is required.

## Android permissions

Current Android manifests declare:
- android.permission.CAMERA: Required to capture photos.
- android.permission.READ_MEDIA_IMAGES: Required on Android 13+ (API 33+) for gallery access.
- android.permission.READ_EXTERNAL_STORAGE with android:maxSdkVersion="32": Used on Android 12 and lower for legacy gallery access.
- android.permission.INTERNET: Added in debug/profile manifests for development tooling and hot reload. Release builds don’t require it explicitly for Flutter tooling.

Runtime permission handling:
- The app requests camera and photo/gallery permissions via permission_handler where applicable (see lib/services/camera_service.dart).

## iOS permissions

If you add an iOS build target, include these keys in ios/Runner/Info.plist:
- NSCameraUsageDescription: Explain why the camera is needed (e.g., “Capture a photo of the menu.”).
- NSPhotoLibraryAddUsageDescription (if you ever add save-to-library features).
- NSPhotoLibraryUsageDescription (if you let users pick from gallery; some iOS versions require this more general key).

The repository does not currently include the iOS folder; add the keys once you create an iOS target.

## Running the app and previews

From the app directory:
  cd menu-image-generator-182975-182984/menu_image_generator_frontend
  flutter pub get
  flutter run

Optional:
  flutter analyze
  flutter test

Using helpers (recommended to avoid path issues):

From repository root:
  ./run_flutter_ci.sh pubget
  ./run_flutter_ci.sh analyze
  ./run_flutter_ci.sh test
  ./run_flutter_ci.sh run

From container root (menu-image-generator-182975-182984/):
  ./run_flutter_path_proxy.sh analyze
  ./run_flutter_path_proxy.sh test
  ./run_flutter_path_proxy.sh run

Ensure scripts are executable in your environment:
  chmod +x run_flutter_ci.sh
  chmod +x menu-image-generator-182975-182984/run_flutter_ci.sh
  chmod +x menu-image-generator-182975-182984/run_flutter_path_proxy.sh

## Privacy and security

- Do not print or log the OPENAI_API_KEY. The codebase avoids logging secrets and throws friendly errors without including sensitive values (see lib/services/openai_service.dart).
- The app does not exfiltrate user data. Network requests go directly to OpenAI endpoints to fulfill the OCR-like and image-generation features, and local history is stored using shared_preferences on device.
- If you copy logs for debugging, review them for sensitive content before sharing.

## Troubleshooting

- “Could not determine project root directory for Flutter project”:
  - Run all Flutter commands from the app directory, or use the provided helpers which read flutter_project_path.yaml to cd into the correct path automatically.
- Build errors after changing pubspec.yaml:
  - Always run flutter pub get before analyze/test/run.
- Missing API key banner / disabled actions:
  - Ensure .env exists in the app directory and OPENAI_API_KEY is set. Restart the app after adding it.
- Android gallery access on older devices:
  - READ_EXTERNAL_STORAGE applies up to SDK 32. For SDK 33+, READ_MEDIA_IMAGES is used automatically.
