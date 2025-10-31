#!/usr/bin/env bash
set -euo pipefail

# Ensure we are in the correct Flutter project directory for analysis/build
cd "$(dirname "$0")/menu_image_generator_frontend"

flutter pub get
# Analyze with no-fatal-infos to avoid failing on warnings; CI will still surface problems
flutter analyze
