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

# Runs once per user on first login to set up Waylandcraft
INSTANCES_SRC="/usr/share/waylandcraft/instances"
PRISM_DIR="$HOME/.local/share/prism-launcher/instances"
CONFIG_SRC="/usr/share/waylandcraft/rc.xml"
CONFIG_DEST="$HOME/.config/labwc-waylandcraft/rc.xml"
FLAG_FILE="$HOME/.local/share/waylandcraft/.setup-done"

# Only run once per user
[ -f "$FLAG_FILE" ] && return 0

# Copy labwc config if not already present
if [ ! -f "$CONFIG_DEST" ]; then
    mkdir -p "$(dirname "$CONFIG_DEST")"
    cp "$CONFIG_SRC" "$CONFIG_DEST"
fi

# Copy all instances that aren't already present
mkdir -p "$PRISM_DIR"
for instance in "$INSTANCES_SRC"/*/; do
    name=$(basename "$instance")
    if [ ! -d "$PRISM_DIR/$name" ]; then
        cp -a "$instance" "$PRISM_DIR/"
    fi
done

# Mark setup as done
mkdir -p "$(dirname "$FLAG_FILE")"
touch "$FLAG_FILE"