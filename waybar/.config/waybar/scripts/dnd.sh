#!/bin/bash
status=$(swaync-client --get-dnd 2>/dev/null)

if [ "$status" = "true" ]; then
  echo '{"text": "󰂛", "tooltip": "DND On", "class": "active"}'
else
  echo '{"text": "󰂜", "tooltip": "DND Off"}'
fi
