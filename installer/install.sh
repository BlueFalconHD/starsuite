#!/usr/bin/env bash

if [[ ! -f "$HOME/.starsuite_ignore" ]]; then
  if [[ ! $(which wezterm) ]] || [[ ! $(which starship) ]]; then
    echo "🔥 Starsuite cannot find WezTerm or Starship. Please install both of these and try again. If you would like to ignore this error, run the following:"
    echo "💾 touch ~/.starsuite_ignore"
    exit 0
  fi
fi

if [[ -f "$HOME/.config/.starsuite_lock" ]]; then
  echo "🔥 Error: File ~/.config/.starsuite_lock exists. This is put in place to prevent broken overwrites. To fix, run this command, then rerun this script."
  echo "💾 rm ~/.config/.starsuite_lock"
  exit 0
fi

if [[ ! -d "$HOME/.config" ]]; then
  echo "🚀 Creating ~/.config directory because it doesn't exist."
  mkdir ~/.config/
fi

if [[ ! -d "$HOME/.config/.starsuite_backups" ]]; then
  echo "🚀 Creating ~/.config/.starsuite_backups because it doesn't exist."
  mkdir ~/.config/.starsuite_backups
fi

if [[ -d "$HOME/.config/wezterm" ]]; then
  echo "🚀 Backing up ~/.config/wezterm to ~/.config/.starsuite_backups/wezterm"
  cp -rf ~/.config/wezterm ~/.config/.starsuite_backups/
  echo "🚀 Removing original ~/.config/wezterm"
  rm -rf ~/.config/wezterm
fi

if [[ -f "$HOME/.config/starship.toml" ]]; then
  echo "🚀 Backing up ~/.config/starship.toml to ~/.config/.starsuite_backups/starship.toml"
  cp -rf ~/.config/wezterm ~/.config/.starsuite_backups/
  echo "🚀 Removing original ~/.config/starship.toml"
  rm ~/.config/starship.toml
fi

echo "🚀 Copying Starsuite dotfiles to ~/.config"
cp -rf ../.config/wezterm ~/.config
cp ../.config/starship.toml ~/.config/

echo "🚀 Creating ~/.config/.starsuite_lock"
echo "✨ The stars are now shining. Restart WezTerm and Starship if needed."
