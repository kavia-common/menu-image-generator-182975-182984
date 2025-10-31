# Workspace: code-generation

This workspace contains one Flutter app:

- menu-image-generator-182975-182984/menu_image_generator_frontend

Run Flutter commands from within the app directory:

cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter run

If a tool reports "Could not determine project root directory for Flutter project", ensure it is pointed at the app directory above.

CI/automation note:
- Always change directory into the app folder before running flutter commands:
  cd menu-image-generator-182975-182984/menu_image_generator_frontend
  flutter pub get
  flutter analyze
  flutter test
  flutter run
- Running from repository root will cause the “project root” error.
- Alternative: from repo root, use the helper script which reads flutter_project_path.yaml and cds for you:
  ./menu-image-generator-182975-182984/menu_image_generator_frontend/run_flutter_ci.sh analyze
  ./menu-image-generator-182975-182984/menu_image_generator_frontend/run_flutter_ci.sh test
  ./menu-image-generator-182975-182984/menu_image_generator_frontend/run_flutter_ci.sh run
