#!/usr/bin/env bash
set -euo pipefail

for cmd in zenity grim slurp wf-recorder; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    zenity --error --title="Missing dependency" --text="'$cmd' is not installed."
    exit 1
  fi
done

CHOICE=$(zenity --list --title="ScreenCap" --radiolist \
  --column "" --column "Action" \
  TRUE "Screenshot" FALSE "Record")

if [ -z "${CHOICE:-}" ]; then
  exit 0
fi

case $CHOICE in
  "Screenshot")
      mkdir -p ~/Pictures
      grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%F_%T).png
      ;;
  "Record")
      mkdir -p ~/Videos
      wf-recorder -g "$(slurp)" -f ~/Videos/record-$(date +%F_%T).mp4
      ;;
esac