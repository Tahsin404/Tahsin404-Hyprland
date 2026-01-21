#!/bin/bash

# 1. Welcome Message
echo "❄️  Installing Tahsin's Hyprland Setup..."

# 2. Install Packages (Arch Linux specific)
echo "📦 Installing required packages..."
sudo pacman -S --needed hyprland waybar wofi kitty dunst starship git

# 3. Backup their existing configs (Be nice!)
echo "💾 Backing up existing configs..."
mkdir -p ~/.config/hypr-backup
[ -d ~/.config/hypr ] && mv ~/.config/hypr ~/.config/hypr-backup/
[ -d ~/.config/waybar ] && mv ~/.config/waybar ~/.config/hypr-backup/
[ -d ~/.config/kitty ] && mv ~/.config/waybar ~/.config/hypr-backup/
[ -d ~/.config/wofi ] && mv ~/.config/waybar ~/.config/hypr-backup/

# 4. Copy the new configs
echo "🚀 Copying new configs..."
cp -r ./Configs/* ~/.config/

chmod +x ~/.config/hypr/scripts/* 2>/dev/null

echo "Done! Please restart Hyprland (Super + M)."
