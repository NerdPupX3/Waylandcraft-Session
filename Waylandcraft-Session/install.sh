#!/bin/bash
#
# Copyright (C) 2026 Mocha Hois
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

set -e

cd "$(dirname "$0")"


if ! command -v pacman &>/dev/null; then
    echo "Error: This script requires an Arch-based system."
    exit 1
fi

echo "Updating package database and system..."
sudo pacman -Syu

echo "Installing labwc, prismlauncher, pavucontrol and libxkbcommon..."
sudo pacman -S --needed labwc prismlauncher pavucontrol libxkbcommon

if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
fi

yay -S wlcontrol

echo "Copying labwc config..."
mkdir -p "$HOME/.config/labwc-waylandcraft"
cp config/rc.xml "$HOME/.config/labwc-waylandcraft/rc.xml"

echo "Installing start script..."
sudo cp scripts/start-waylandcraft.sh /usr/bin/start-waylandcraft.sh
sudo chmod +x /usr/bin/start-waylandcraft.sh

echo "Installing Wayland session file..."
sudo cp waylandcraft-session.desktop /usr/share/wayland-sessions/

copy_instance() {
    local instance_name="$1"
    local prism_instances_dir="$HOME/.local/share/PrismLauncher/instances"
    local source_dir="$PWD/instances/$instance_name"

    if [ ! -d "$source_dir" ]; then
        echo "Error: Instance directory '$source_dir' does not exist."
        exit 1
    fi

    mkdir -p "$prism_instances_dir"

    if [ -d "$prism_instances_dir/$instance_name" ]; then
        echo "Removing existing instance '$instance_name'..."
        rm -rf "$prism_instances_dir/$instance_name"
    fi

    echo "Copying instance '$instance_name'..."
    cp -a "$source_dir" "$prism_instances_dir/"
    echo "Instance copied successfully."
}

echo "Select the Waylandcraft instance to install:"
options=("Waylandcraft Extended" "Waylandcraft Original" "Quit")
PS3="Enter choice [1-3]: "
select opt in "${options[@]}"; do
    case "$opt" in
        "Waylandcraft Extended")
            copy_instance "(DO NOT DELETE) Waylandcraft Extended"
            break
            ;;
        "Waylandcraft Original")
            copy_instance "(DO NOT DELETE) Waylandcraft original"
            break
            ;;
        "Quit")
            echo "Exiting without copying instance."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a number from the list."
            ;;
    esac
done

echo "Installation complete! You can now select 'Waylandcraft Session' from your login manager."