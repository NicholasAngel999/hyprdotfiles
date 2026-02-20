# This is to fix audio on ubuntu 24.04 systems
---

soundwave@soundwave:~$ mkdir -p ~/.config/systemd/user/
soundwave@soundwave:~$ cat <<EOF > ~/.config/systemd/user/alsa-unmute.service
[Unit]
Description=Fix ES83xx headphone mute on login
After=pipewire.service

[Service]
Type=oneshot
ExecStartPre=/bin/sleep 8
ExecStart=/bin/sh -c "/usr/bin/amixer -c 1 set 'Headphone' unmute 100% || true"
ExecStartPost=/bin/sh -c "/usr/bin/amixer -c 1 set 'Headphone Mixer' on || true"
ExecStartPost=/bin/sh -c "/usr/bin/amixer -c 1 set 'Speaker' unmute 100% || true"

[Install]
WantedBy=default.target
EOF
soundwave@soundwave:~$ systemctl --user daemon-reload
systemctl --user enable alsa-unmute.service
systemctl --user start alsa-unmute.service
Created symlink /home/soundwave/.config/systemd/user/default.target.wants/alsa-unmute.service → /home/soundwave/.config/systemd/user/alsa-unmute.service.
soundwave@soundwave:~$ 



### Just run these in a terminal and sound should work 
