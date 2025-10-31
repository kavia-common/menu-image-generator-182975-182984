#!/usr/bin/env bash
# Container-root helper: reads the local flutter_project_path.yaml and proxies into the Flutter app directory.
# Usage:
#   ./run_flutter_path_proxy.sh pubget|analyze|test|run
set -euo pipefail

YAML="flutter_project_path.yaml"
if [ ! -f "$YAML" ]; then
  echo "Could not find $YAML in container root: $(pwd)"
  exit 1
fi

APP_REL_PATH=$(awk -F': ' '/flutter_project_relative_path/ {print $2}' "$YAML" | tr -d '\r')
if [ -z "${APP_REL_PATH:-}" ]; then
  echo "Could not read flutter_project_relative_path from $YAML"
  exit 1
fi

APP_SCRIPT="$APP_REL_PATH/run_flutter_ci.sh"
if [ ! -f "$APP_SCRIPT" ]; then
  echo "App runner script not found at $APP_SCRIPT"
  exit 1
fi

exec "$APP_SCRIPT" "${1:-}"
