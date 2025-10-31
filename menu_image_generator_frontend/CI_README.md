# CI Helper: Correct Working Directory

Always run Flutter commands from within the app directory:

cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter analyze
flutter test
flutter run

If your tooling starts from the repository root, read flutter_project_path.yaml at the root:
- flutter_project_relative_path: menu-image-generator-182975-182984/menu_image_generator_frontend

Then cd into that folder before running any Flutter commands.

Troubleshooting:
- Error: "Could not determine project root directory for Flutter project"
  Fix: Ensure your working directory is menu-image-generator-182975-182984/menu_image_generator_frontend before invoking Flutter.
