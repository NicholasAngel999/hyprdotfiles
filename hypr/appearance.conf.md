# source = ~/.config/hypr/appearance.conf

#########################
### Gerneal Apperance ###
#########################

general {
  gaps_in = 3
  gaps_out = 7
  border_size = 3
   col.active_border = rgba(cba6f7ee) rgba(a6e3a1ee) 135deg
  col.inactive_border = rgba(444555aa)
  layout = dwindle
}

decoration {
  rounding = 10
  blur {
    enabled = true
    size = 8
    passes = 3
    new_optimizations = true
    ignore_opacity = false
  }

}

animations {
   enabled = yes
  bezier = easein, 0.25, 0.8, 0.5, 1.0
  animation = windows, 1, 5, easein, popin
  animation = border, 1, 10, default
  animation = fade, 1, 10, default
  animation = workspaces, 1, 6, easein, slide
}