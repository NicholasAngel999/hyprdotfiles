# This is to fix audio on ubuntu 24.04 systems
---

mkdir -p ~/.config/autostart && cat <<EOF > ~/.config/autostart/fix-audio-mute.desktop
[Desktop Entry]
Type=Application
Name=Fix Audio Mute
Comment=Unmutes the persistent headphone bug
Exec=sh -c "sleep 10; amixer -c 1 set Headphone,0 100% unmute"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Terminal=false
EOF

*paste the entire block into terminal*
