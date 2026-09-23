#!/usr/bin/env bash

set -euo pipefail

echo "==> Starting environment setup..."

# 1. Install Homebrew packages if Homebrew is installed
if command -v brew &>/dev/null; then
  echo "==> Installing Starship and FZF via Homebrew..."
  brew install starship fzf
else
  echo "==> Homebrew not found. Ensure starship and fzf are installed on your system."
fi

# 2. Install Oh My Zsh (unattended, non-interactive)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh is already installed."
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# 3. Clone zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "==> Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "==> zsh-autosuggestions already exists."
fi

# 4. Clone zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "==> Cloning zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "==> zsh-syntax-highlighting already exists."
fi

# 5. Run FZF keybindings & completion installer non-interactively
if [ -f "$(brew --prefix 2>/dev/null)/opt/fzf/install" ]; then
  echo "==> Setting up FZF keybindings and completions..."
  "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish --no-update-rc
fi

# 6. Backup existing ~/.zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
  echo "==> Backing up current ~/.zshrc to ~/.zshrc.backup..."
  cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# 7. Write final ~/.zshrc configuration
echo "==> Writing updated ~/.zshrc..."
cat << 'EOF' > "$HOME/.zshrc"
### BEGIN STRIPE
# All Stripe related shell configuration
# is at ~/.stripe/shellinit/zshrc and is
# persistently managed by Chef. You shouldn't
# remove this unless you don't want to load
# Stripe specific shell configurations.
#
# Feel free to add your customizations in this
# file (~/.zshrc) after the Stripe config
# is sourced.
if [[ -f ~/.stripe/shellinit/zshrc ]]; then
  source ~/.stripe/shellinit/zshrc
fi
### END STRIPE

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME=""

# Which plugins would you like to load?
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Set Cursor as the default terminal editor
export EDITOR="cursor --wait"
export VISUAL="cursor --wait"

# Initialize Starship
eval "$(starship init zsh)"

# FZF integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
EOF

echo "==> Setup complete! Reloading Zsh..."
echo "==> Run: source ~/.zshrc"