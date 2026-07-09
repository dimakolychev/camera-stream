#!/usr/bin/env bash
set -euo pipefail

exec /usr/bin/python3 -m http.server 8080 --directory /opt/camera-stream/www
