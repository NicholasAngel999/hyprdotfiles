#!/bin/bash
# 212th Attack Battalion - Hyprland Install Script
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

print_header "212th Attack Battalion - Dotfiles Setup"

# --- 1. Install yay (AUR helper) ---
if ! command -v yay &>/dev/null; then
  print_header "Installing yay"
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
  rm -rf /tmp/yay
fi

# --- 2. Install pacman packages ---
print_header "Installing core packages"

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
  stow \
  zoxide fzf \
  git curl wget \
  rust

# --- 3. Install AUR packages ---
print_header "Installing AUR packages"

yay -S --needed --noconfirm \
  bluetui \
  zapzap \
  visual-studio-code-electron-bin \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  fastfetch \
  hyprland-qtutils

# --- 4. Install impala-nm via cargo ---
print_header "Installing impala-nm"

if ! command -v impala-nm &>/dev/null; then
  cargo install impala-nm
else
  echo "impala-nm already installed"
fi

# --- 5. Ensure cargo in PATH ---
print_header "Configuring cargo PATH"

if ! grep -q '.cargo/bin' "$HOME/.zshrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >>"$HOME/.zshrc"
fi

# --- 6. Enable services ---
print_header "Enabling services"

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon

# --- 7. Clone or update dotfiles ---
print_header "Setting up dotfiles"

if [ ! -d "$DOTFILES" ]; then
  git clone "$REPO" "$DOTFILES"
else
  echo "Dotfiles exist, pulling latest..."
  git -C "$DOTFILES" pull
fi

# --- 8. Stow dotfiles ---
print_header "Stowing configuration"

cd "$DOTFILES"

for dir in hypr waybar wofi swaync kitty nvim starship zsh; do
  if [ -d "$dir" ]; then
    echo "Stowing $dir"
    stow --adopt "$dir"
  fi
done

# --- 9. Set default shell to zsh ---
print_header "Setting default shell"

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s /usr/bin/zsh
fi

# --- 10. Install zsh plugins (fallback safety) ---
print_header "Ensuring zsh plugins"

mkdir -p ~/.zsh/plugins

[ -d ~/.zsh/plugins/zsh-autosuggestions ] ||
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions

[ -d ~/.zsh/plugins/zsh-syntax-highlighting ] ||
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting

# --- 11. fzf keybindings ---
print_header "Configuring fzf"

if [ ! -f ~/.fzf.zsh ]; then
  [ -f /usr/share/fzf/key-bindings.zsh ] &&
    echo "[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh" >>~/.zshrc
fi

# --- DONE ---
print_header "Setup Complete"

echo "Reboot or log out, then start Hyprland."
