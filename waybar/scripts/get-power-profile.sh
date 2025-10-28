#!/bin/bash

PROFILE=$(powerprofilesctl get)

case $PROFILE in
  performance)
    ICON="performance" # Performance icon (adjust if needed)
    ;;
  balanced)
    ICON="balance-scale" # Balanced icon (adjust if needed)
    ;;
  power-saver)
    ICON="leaf" # Power saver icon (adjust if needed)
    ;;
  *)
    ICON="question" # Unknown state icon
    ;;
esac

echo "{\"text\": \"$ICON\", \"tooltip\": \"Power Profile: $PROFILE\"}"
