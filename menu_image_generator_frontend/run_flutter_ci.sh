#!/usr/bin/env bash
# Proxy helper to run Flutter commands from the correct app directory.
# Usage examples:
#   ./run_flutter_ci.sh pubget
#   ./run_flutter_ci.sh analyze
#   ./run_flutter_ci.sh test
#   ./run_flutter_ci.sh run

set -euo pipefail

APP_REL_PATH=$(awk -F': ' '/flutter_project_relative_path/ {print $2}' flutter_project_path.yaml | tr -d '\r')
if [ -z "${APP_REL_PATH:-}" ]; then
  echo "Could not read flutter_project_relative_path from flutter_project_path.yaml"
  exit 1
fi

cd "$APP_REL_PATH"

case "${1:-}" in
  pubget)
    flutter pub get
    ;;
  analyze)
    flutter pub get
    flutter analyze
    ;;
  test)
    flutter pub get
    CI=true flutter test --no-pub
    ;;
  run)
    flutter pub get
    flutter run
    ;;
  *)
    echo "Unknown command. Use one of: pubget | analyze | test | run"
    exit 2
    ;;
esac
