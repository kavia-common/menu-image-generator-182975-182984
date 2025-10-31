# CI Helper: Run Flutter from correct app directory

Always run Flutter commands from within the app directory:

cd menu-image-generator-182975-182984/menu_image_generator_frontend
flutter pub get
flutter analyze
flutter test
flutter run

If your tooling starts at the repository root, use the proxy helper:
./run_flutter_ci.sh analyze
./run_flutter_ci.sh test
./run_flutter_ci.sh run

If your tooling starts at the container root (menu-image-generator-182975-182984/), use:
./run_flutter_path_proxy.sh analyze
./run_flutter_path_proxy.sh test
./run_flutter_path_proxy.sh run

Tip: Ensure scripts are executable in your environment:
chmod +x run_flutter_ci.sh
chmod +x menu-image-generator-182975-182984/run_flutter_ci.sh
chmod +x menu-image-generator-182975-182984/run_flutter_path_proxy.sh
