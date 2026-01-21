#!/bin/bash

FOLDERS=("hypr" "waybar" "wofi" "kitty" "dunst" "rofi")

echo "📦 Packaging your rice..."
for folder in "${FOLDERS[@]}"; do
  if [ -d "$HOME/.config/$folder" ]; then
    echo "   - Copying $folder..."
    rm -rf ./Configs/$folder
    cp -rL $HOME/.config/$folder ./Configs/
  else
    echo "   ⚠️ Warning: $HOME/.config/$folder not found!"
  fi
done

rm -rf ./Configs/hypr/hyprland.log

echo "✅ Rice updated! Ready to git push."
