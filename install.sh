#!/bin/bash

set -e

echo "📦 Installing required packages..."
sudo pacman -S --noconfirm waybar dunst wofi hyprland rofi kitty \
    ttf-jetbrains-mono-nerd ttf-font-awesome brightnessctl network-manager-applet swaybg

echo "📁 Creating config directories..."
mkdir -p ~/.config/{hypr,waybar,dunst,wofi,wallpapers,scripts}

echo "🔗 Symlinking config files..."
ln -sf "$(pwd)/hypr/"* ~/.config/hypr/
ln -sf "$(pwd)/waybar/"* ~/.config/waybar/
ln -sf "$(pwd)/dunst/"* ~/.config/dunst/
ln -sf "$(pwd)/wofi/"* ~/.config/wofi/

echo "🖼️  Setting wallpaper (make sure image exists)..."
cp -r wallpapers/* ~/.config/wallpapers/

echo "🧪 Checking for swaybg in hyprland.conf..."
if ! grep -q swaybg ~/.config/hypr/hyprland.conf; then
  echo 'exec-once = swaybg -i ~/.config/wallpapers/YOUR_IMAGE.png -m fill' >> ~/.config/hypr/hyprland.conf
fi

echo "✅ Done. You can now start Hyprland or restart Waybar:"
echo "   pkill waybar && waybar &"
