#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ] || [ "$#" -gt 4 ]; then
  echo "Usage: $0 DEVICE PORT [WIDTHxHEIGHT] [FPS]" >&2
  exit 1
fi

DEVICE="$1"
PORT="$2"
RESOLUTION="${3:-1280x720}"
FPS="${4:-15}"

if [ ! -e "$DEVICE" ]; then
  echo "Camera device not found: $DEVICE" >&2
  exit 1
fi

exec /usr/bin/ustreamer \
  --device="$DEVICE" \
  --host=0.0.0.0 \
  --port="$PORT" \
  --resolution="$RESOLUTION" \
  --format=MJPEG \
  --encoder=HW \
  --desired-fps="$FPS" \
  --persistent \
  --buffers=2 \
  --workers=1 \
  --tcp-nodelay \
  --allow-origin='*' \
  --server-timeout=5 \
  --process-name-prefix="cam:${PORT}"
