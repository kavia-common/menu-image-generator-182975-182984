#!/usr/bin/env bash
# Proxy to the app-level script to ensure commands run from the correct Flutter project directory.
# Usage (from repository or container root):
#   ./menu-image-generator-182975-182984/run_flutter_ci.sh pubget|analyze|test|run
set -euo pipefail

APP_SCRIPT="menu_image_generator_frontend/run_flutter_ci.sh"
if [ ! -f "$APP_SCRIPT" ]; then
  echo "Unable to locate app helper script at $APP_SCRIPT"
  echo "Ensure you are running from: menu-image-generator-182975-182984/"
  exit 1
fi

exec "$APP_SCRIPT" "${1:-}"
