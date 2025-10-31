# Tooling Path Hint

The Flutter app is not at the repository root.

Flutter app path:
- menu-image-generator-182975-182984/menu_image_generator_frontend

Tools starting at the repository or workspace root should read flutter_project_path.yaml at:
- repository root: flutter_project_path.yaml
- container root: menu-image-generator-182975-182984/flutter_project_path.yaml

Then change directory into that folder before running Flutter commands:

cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter analyze
flutter test
flutter run
