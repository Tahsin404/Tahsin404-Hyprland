#!/bin/bash

# 1. Define what folders you want to share
# (Add kitty, alacritty, or whatever else you use)
FOLDERS=("hypr" "waybar" "wofi" "kitty" "dunst" "rofi")

# 2. Loop through them and copy from your system to this repo
echo "📦 Packaging your rice..."
for folder in "${FOLDERS[@]}"; do
  if [ -d "$HOME/.config/$folder" ]; then
    echo "   - Copying $folder..."
    rm -rf ./Configs/$folder # Delete old copy
    cp -r $HOME/.config/$folder ./Configs/
  else
    echo "   ⚠️ Warning: $HOME/.config/$folder not found!"
  fi
done

# 3. Clean up (Optional)
# Remove generated files or history you don't want to share
rm -rf ./Configs/hypr/hyprland.log

echo "✅ Rice updated! Ready to git push."
