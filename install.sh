#!/bin/bash

set -e

# Function to print section headers
echo_section() {
  echo
  echo "=============================="
  echo "$1"
  echo "=============================="
}

# Check for Homebrew and install if not present
echo_section "Checking for Homebrew"
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.zprofile
  eval "$($(brew --prefix)/bin/brew shellenv)"
else
  echo "Homebrew is already installed."
fi

# Update Homebrew
echo_section "Updating Homebrew"
brew update

# Install CLI tools
echo_section "Installing CLI tools"
if [ -f cli-tools.txt ]; then
  while IFS= read -r tool; do
    [[ -z "$tool" || "$tool" =~ ^# ]] && continue
    if brew list "$tool" &>/dev/null; then
      echo "$tool is already installed."
    else
      echo "Installing $tool..."
      brew install "$tool"
    fi
  done < cli-tools.txt
else
  echo "cli-tools.txt not found. Skipping CLI tools."
fi

# Install GUI applications
echo_section "Installing GUI applications"
if [ -f gui-apps.txt ]; then
  while IFS= read -r app; do
    [[ -z "$app" || "$app" =~ ^# ]] && continue
    if brew list --cask "$app" &>/dev/null; then
      echo "$app is already installed."
    else
      echo "Installing $app..."
      brew install --cask "$app"
    fi
  done < gui-apps.txt
else
  echo "gui-apps.txt not found. Skipping GUI apps."
fi

# Install fonts
echo_section "Installing Fonts"
if [ -f fonts.txt ]; then
  while IFS= read -r font; do
    [[ -z "$font" || "$font" =~ ^# ]] && continue
    if brew list --cask "$font" &>/dev/null; then
      echo "$font is already installed."
    else
      echo "Installing $font..."
      brew install --cask "$font"
    fi
  done < fonts.txt
else
  echo "fonts.txt not found. Skipping fonts."
fi

echo_section "Setup Complete!" 