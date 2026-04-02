#!/bin/bash

PROFILE=$(powerprofilesctl get 2>/dev/null)

case $PROFILE in
performance)
  ICON="󰓅"
  ;;
balanced)
  ICON="󰗑"
  ;;
power-saver)
  ICON=""
  ;;
*)
  ICON="❓"
  ;;
esac

echo "{\"text\": \"$ICON\", \"tooltip\": \"Power Profile: $PROFILE\"}"
