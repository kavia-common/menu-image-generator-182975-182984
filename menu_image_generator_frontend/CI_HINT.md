# CI Hint

Run Flutter commands from this app directory only.

For automation:
- From repository root: ../../run_flutter_ci.sh analyze|test|run
- From container root: ../run_flutter_path_proxy.sh analyze|test|run

Always run:
flutter pub get
before analyze/test/run.
