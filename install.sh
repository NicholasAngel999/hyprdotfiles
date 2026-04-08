#!/bin/bash
# 212th Attack Battalion - Commander Cody Edition
# Target: CachyOS / Arch-based systems

set -e

DOTFILES="$HOME/hyprdotfiles"
REPO="https://github.com/NicholasAngel999/hyprdotfiles.git"

print_header() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  $1"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

print_header "Initializing 212th Attack Battalion Setup"

# --- 1. Install yay (AUR helper) ---
if ! command -v yay &>/dev/null; then
  print_header "Installing yay"
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
  rm -rf /tmp/yay
fi

# --- 2. Install pacman packages ---
print_header "Installing Core Republic Software"

sudo pacman -S --needed --noconfirm \
  hyprland hyprlock hypridle hyprpaper hyprsunset \
  waybar wofi swaync \
  kitty \
  starship zsh \
  neovim \
  networkmanager \
  bluez bluez-utils \
  brightnessctl \
  playerctl \
  wl-clipboard cliphist \
  grim slurp swappy \
  pipewire wireplumber pavucontrol \
  power-profiles-daemon \
  polkit-kde-agent \
  ttf-jetbrains-mono-nerd \
  inter-font \
  stow \
  zoxide fzf \
  git curl wget \
  rust \
  papirus-icon-theme # Good fallback for your theme

# --- 3. Install AUR packages ---
print_header "Installing Specialized AUR Gear"

yay -S --needed --noconfirm \
  bluetui \
  visual-studio-code-electron-bin \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  fastfetch \
  hyprland-qtutils

# --- 4. Install impala-nm via cargo ---
print_header "Installing impala-nm (TUI Network Manager)"

if ! command -v impala-nm &>/dev/null; then
  # Ensure rust/cargo is actually ready
  if command -v cargo &>/dev/null; then
    cargo install impala-nm
  else
    echo "Error: Cargo not found. Skipping impala-nm."
  fi
else
  echo "impala-nm already installed, skipping..."
fi

# Ensure cargo bin is in the current session's path for the rest of the script
export PATH="$HOME/.cargo/bin:$PATH"

# --- 5. Enable services ---
print_header "Booting up Droid Services"

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon

# --- 6. Clone or update dotfiles ---
print_header "Syncing with HQ (GitHub)"

if [ ! -d "$DOTFILES" ]; then
  git clone "$REPO" "$DOTFILES"
else
  echo "Dotfiles exist, pulling latest mission data..."
  git -C "$DOTFILES" pull
fi

# --- 7. Prep Config Directories ---
# This prevents Stow from getting confused if directories already exist
mkdir -p ~/.config/{hypr,waybar,wofi,swaync,kitty,fastfetch,starship}

# --- 8. Stow dotfiles ---
print_header "Deploying 212th Configurations"

cd "$DOTFILES"

# Updated list to include everything we built today
for dir in hypr waybar wofi swaync kitty nvim starship zsh fastfetch; do
  if [ -d "$dir" ]; then
    echo "Stowing $dir..."
    # --adopt ensures if local files exist, they are linked to the repo version
    stow --adopt "$dir"
  fi
done

# --- 9. Set default shell to zsh ---
print_header "Assigning ZSH to Commander"

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  sudo chsh -s /usr/bin/zsh "$USER"
fi

# --- 10. Final Permissions ---
print_header "Finalizing Permissions"
chmod +x "$DOTFILES/waybar/.config/waybar/scripts/"*.sh

# --- DONE ---
print_header "Mission Complete: 212th System Online"

echo "The coordinates are set. Reboot or log out to enter the 212th Battalion."
