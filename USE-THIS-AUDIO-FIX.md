# This is to fix audio on ubuntu 24.04 systems
---

nano ~/.config/autostart/fix-audio-mute.desktop

[Desktop Entry]
Type=Application
Name=Fix Audio Mute
Comment=Unmutes the persistent headphone bug
Exec=sh -c "sleep 15; amixer -c 1 set Headphone,0 100% unmute"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Terminal=false


chmod +x ~/.config/autostart/fix-audio-mute.desktop

