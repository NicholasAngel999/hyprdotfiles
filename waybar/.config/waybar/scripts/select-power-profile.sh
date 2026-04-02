#!/bin/bash

# Define the power profile options
options="Performance\nBalanced\nPower Saver"

# Show the menu using wofi in dmenu mode and capture the selection
# Point -S to a file that doesn't exist
selected=$(echo -e "$options" | wofi --dmenu --prompt "Select Power Profile:" --style ~/.config/wofi/style-powermenu.css)

# Execute the command based on the selection
case $selected in
"Performance")
  powerprofilesctl set performance
  ;;
"Balanced")
  powerprofilesctl set balanced
  ;;
"Power Saver")
  powerprofilesctl set power-saver
  ;;
*)
  # Do nothing if selection is empty (e.g., user pressed Esc)
  ;;
esac

# Optional: Send a notification to confirm the change (requires notify-send)
if [ -n "$selected" ]; then
  notify-send "Power Profile Set" "$selected"
fi

exit 0
