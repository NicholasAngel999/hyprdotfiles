#!/bin/bash
# Simple toggle script for power-profiles-daemon
# Cycles between performance → balanced → power-saver

current=$(powerprofilesctl get)

case "$current" in
  performance)
    powerprofilesctl set balanced
    notify-send "⚖️ Power Profile" "Switched to Balanced"
    ;;
  balanced)
    powerprofilesctl set power-saver
    notify-send "🔋 Power Profile" "Switched to Power Saver"
    ;;
  power-saver)
    powerprofilesctl set performance
    notify-send "🚀 Power Profile" "Switched to Performance"
    ;;
esac

