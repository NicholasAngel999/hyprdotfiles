#!/bin/bash

dnd=$(swaync-client --get-dnd 2>/dev/null)
count=$(swaync-client --count 2>/dev/null)

# fallback if empty
count=${count:-0}

if [ "$dnd" = "true" ]; then
  icon="󰂛"
  class="active"
  tooltip="DND On"
else
  icon="󰂜"
  class=""
  tooltip="DND Off"
fi

# If there are notifications
if [ "$count" -gt 0 ]; then
  icon="$icon $count"
  class="$class notify"
  tooltip="$tooltip ($count notifications)"
fi

echo "{\"text\": \"$icon\", \"tooltip\": \"$tooltip\", \"class\": \"$class\"}"
