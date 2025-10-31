# Correct Working Directory

Always run Flutter commands from within this app directory:

cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter analyze
flutter test
flutter run

If you start from the repository root, use the helper:
./run_flutter_ci.sh analyze

Or read flutter_project_path.yaml at the repository root to locate the app path.
