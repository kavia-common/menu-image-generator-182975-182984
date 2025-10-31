#!/usr/bin/env bash
# Workspace-level helper: reads the path from flutter_project_path.yaml and proxies commands into the real Flutter app directory.
# Usage:
#   ./run_flutter_ci.sh pubget|analyze|test|run
set -euo pipefail

# Locate the app path from the root-level flutter_project_path.yaml
if [ ! -f "flutter_project_path.yaml" ]; then
  echo "flutter_project_path.yaml not found at repository root."
  exit 1
fi

APP_REL_PATH=$(awk -F': ' '/flutter_project_relative_path/ {print $2}' flutter_project_path.yaml | tr -d '\r')
if [ -z "${APP_REL_PATH:-}" ]; then
  echo "Could not read flutter_project_relative_path from flutter_project_path.yaml"
  exit 1
fi

APP_SCRIPT="$APP_REL_PATH/run_flutter_ci.sh"
if [ ! -f "$APP_SCRIPT" ]; then
  echo "Could not locate app runner script at: $APP_SCRIPT"
  exit 1
fi

exec "$APP_SCRIPT" "${1:-}"
