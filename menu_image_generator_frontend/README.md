# Workspace: code-generation

This repository hosts a Flutter app at a non-root path.

Primary Flutter app:
- menu-image-generator-182975-182984/menu_image_generator_frontend

Run Flutter commands from within the app directory:
  cd menu-image-generator-182975-182984/menu_image_generator_frontend
  flutter pub get
  flutter analyze
  flutter test
  flutter run

Automation note:
- Tools starting from repository root can read flutter_project_path.yaml to locate the app folder automatically.
- Prefer using the provided helpers to avoid “Could not determine project root directory for Flutter project” errors:

From repository root:
  ./run_flutter_ci.sh pubget
  ./run_flutter_ci.sh analyze
  ./run_flutter_ci.sh test
  ./run_flutter_ci.sh run

From container root (menu-image-generator-182975-182984/):
  ./run_flutter_path_proxy.sh analyze
  ./run_flutter_path_proxy.sh test
  ./run_flutter_path_proxy.sh run

Tip: Ensure scripts are executable in your environment:
  chmod +x run_flutter_ci.sh
  chmod +x menu-image-generator-182975-182984/run_flutter_ci.sh
  chmod +x menu-image-generator-182975-182984/run_flutter_path_proxy.sh
