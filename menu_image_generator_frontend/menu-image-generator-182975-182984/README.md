# menu-image-generator-182975-182984

Troubleshooting:
- Run Flutter commands inside the app folder:
  cd menu_image_generator_frontend
  flutter pub get
  flutter run
- If tooling reports "Could not determine project root directory for Flutter project", ensure you are inside `menu_image_generator_frontend/` when executing Flutter CLI commands.
- In automated runners starting from this container root, use:
  ./run_flutter_path_proxy.sh analyze
  ./run_flutter_path_proxy.sh test
  ./run_flutter_path_proxy.sh run
  This helper reads flutter_project_path.yaml and proxies into the app folder.
- After updating pubspec.yaml (e.g., adding image_picker or permission_handler), always run `flutter pub get` before building or running the app.
