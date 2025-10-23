# source = ~/.config/hypr/keybinds.conf

###################
### Keybindings ###
###################

bind = SUPER, RETURN, exec, kitty
bind = SUPER, Q, killactive,
bind = SUPER, M, exit,
bind = SUPER, E, exec, $files
bind = SUPER, SPACE, exec, $menu
bind = SUPER, F, fullscreen,
bind = SUPER, V, togglefloating, 
bind = SUPER, L, exec, hyprlock 
bind = SUPER, B, exec, $browser
bind = SUPERSHIFT, E, exec, $manager


# Workspaces
##############

bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, 6, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, 8, workspace, 8
bind = SUPER, 9, workspace, 9
bind = SUPER, 0, workspace, 10


# Move focused window to workspace 
##################################

bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6
bind = SUPER SHIFT, 7, movetoworkspace, 7
bind = SUPER SHIFT, 8, movetoworkspace, 8
bind = SUPER SHIFT, 9, movetoworkspace, 9
bind = SUPER SHIFT, 10, movetoworkspace, 10


# Resize and move windows
############################

bind = SUPER, left, movefocus, l
bind = SUPER, right, movefocus, r
bind = SUPER, up, movefocus, u
bind = SUPER, down, movefocus, d

##############
### Volume ###
##############

bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%
bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%
bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle

##################
### Brightness ###
##################

bind = ,XF86MonBrightnessUp, exec, brightnessctl set +2%
bind = ,XF86MonBrightnessDown, exec, brightnessctl set 2%-