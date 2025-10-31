# CI Helper: Running Flutter commands

Always run Flutter commands from within the app directory:

cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter analyze
flutter test
flutter run

Automation note:
If your CI or tooling starts from the repository root, read flutter_project_path.yaml to locate the actual Flutter project folder:
- flutter_project_relative_path: menu-image-generator-182975-182984/menu_image_generator_frontend

Then cd into that folder before running Flutter commands.
