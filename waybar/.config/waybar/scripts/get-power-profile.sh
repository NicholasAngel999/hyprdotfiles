#!/bin/bash

# Get current profile
PROFILE=$(powerprofilesctl get)

# Map icons and tooltips
case $PROFILE in
"performance")
  ICON="󰓅"
  CLASS="performance"
  ;;
"balanced")
  ICON="⚖️"
  CLASS="balanced"
  ;;
"power-saver")
  ICON="🔋"
  CLASS="power-saver"
  ;;
*)
  ICON="󰓅"
  CLASS="unknown"
  ;;
esac

# Output JSON for Waybar
printf '{"text": "%s", "tooltip": "Power Profile: %s", "class": "%s"}\n' "$ICON" "$PROFILE" "$CLASS"
