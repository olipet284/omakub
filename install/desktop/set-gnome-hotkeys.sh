#!/bin/bash

# Alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>w']"

# Make it easy to maximize like you can fill left/right
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up', '<Super>f', '<Super>k']"

# Minimize window
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>Down', '<Alt>m', '<Super>j']"

# Make it easy to resize undecorated windows
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Super>BackSpace']"

# Make it easy to resize window with mouse
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

# For keyboards that only have a start/stop button for music, like Logitech MX Keys Mini
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Shift>AudioPlay']"

# Full-screen with title/navigation bar
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Shift>F11']"

# Use fixed workspaces instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5

# Disable the hotkeys in the Dash to Dock extension (most likely culprit)
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false

# Use super for workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"

# Set window as always on top
gsettings set org.gnome.desktop.wm.keybindings toggle-above "['<Super>o']"

# Rotate workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Primary><Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Primary><Super>l']"

# Disable default Alt+Space window menu so we can use it for Ulauncher
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

# Open Display Settings
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Primary><Alt>d', '<Super>d']"

# Define custom keybindings as: name, command, binding.
# Add a new shortcut by adding one line: add_custom_keybinding 'Name' 'command' '<Binding>'
CUSTOM_NAMES=()
CUSTOM_COMMANDS=()
CUSTOM_BINDINGS=()

add_custom_keybinding() {
  CUSTOM_NAMES+=("$1")
  CUSTOM_COMMANDS+=("$2")
  CUSTOM_BINDINGS+=("$3")
}

add_custom_keybinding 'Ulauncher' 'sh -c "pgrep -x ulauncher && { ulauncher-toggle || true; } || setsid -f ulauncher"' '<Alt>space'
add_custom_keybinding 'Flameshot' 'sh -c -- "flameshot gui"' '<Control>Print'
add_custom_keybinding 'New Alacritty Window' 'alacritty' '<Super>Return'
add_custom_keybinding 'New Firefox Window' 'firefox --new-window' '<Shift><Super>b'
add_custom_keybinding 'New Brave Window' 'sh -c -- "if command -v brave-browser >/dev/null 2>&1; then exec brave-browser --new-window; elif command -v brave >/dev/null 2>&1; then exec brave --new-window; else exec flatpak run com.brave.Browser --new-window; fi"' '<Shift><Super><Alt>b'
add_custom_keybinding 'Open Work Calendar' 'firefox https://outlook.cloud.microsoft/calendar/view/workweek' '<Shift><Super>c'
add_custom_keybinding 'Open Personal Calendar' 'sh -c -- "if command -v brave-browser >/dev/null 2>&1; then exec brave-browser --new-window https://calendar.google.com/calendar/u/0/r; elif command -v brave >/dev/null 2>&1; then exec brave --new-window https://calendar.google.com/calendar/u/0/r; else exec flatpak run com.brave.Browser --new-window https://calendar.google.com/calendar/u/0/r; fi"' '<Shift><Super><Alt>c'
add_custom_keybinding 'Open Work Email' 'firefox https://outlook.cloud.microsoft/mail/' '<Shift><Super>e'
add_custom_keybinding 'Open Personal Email' 'sh -c -- "if command -v brave-browser >/dev/null 2>&1; then exec brave-browser --new-window https://mail.google.com/mail/u/0/; elif command -v brave >/dev/null 2>&1; then exec brave --new-window https://mail.google.com/mail/u/0/; else exec flatpak run com.brave.Browser --new-window https://mail.google.com/mail/u/0/; fi"' '<Shift><Super><Alt>e'
add_custom_keybinding 'Open Music Player' 'bash -lc "exec alacritty -e termusic"' '<Shift><Super>m'
add_custom_keybinding 'Open YouTube (work profile)' 'firefox https://www.youtube.com/' '<Shift><Super>y'
add_custom_keybinding 'Open YouTube (personal profile)' 'sh -c -- "if command -v brave-browser >/dev/null 2>&1; then exec brave-browser --new-window https://www.youtube.com/; elif command -v brave >/dev/null 2>&1; then exec brave --new-window https://www.youtube.com/; else exec flatpak run com.brave.Browser --new-window https://www.youtube.com/; fi"' '<Shift><Super><Alt>y'
add_custom_keybinding 'Open Obsidian' 'sh -c -- "if [ -x /opt/Obsidian/obsidian ]; then exec /opt/Obsidian/obsidian; elif command -v obsidian >/dev/null 2>&1; then exec obsidian; else exec gtk-launch obsidian.desktop; fi"' '<Shift><Super>o'
add_custom_keybinding 'Open Slack' 'firefox https://sallinggroup.slack.com/' '<Shift><Super>s'
add_custom_keybinding 'Open Teams' 'firefox https://teams.microsoft.com/' '<Shift><Super>t'
add_custom_keybinding 'Open Marktext' 'sh -c -- "if command -v marktext >/dev/null 2>&1; then exec marktext; else exec gtk-launch marktext.desktop; fi"' '<Shift><Super>n'
add_custom_keybinding 'Open Neovim' 'alacritty -e nvim' '<Shift><Super><Alt>n'
add_custom_keybinding 'Open VS Code' 'code' '<Shift><Super>v'
add_custom_keybinding 'Open Bluetooth Settings' 'gnome-control-center bluetooth' '<Control><Super>b'
add_custom_keybinding 'Open Display Settings' 'gnome-control-center display' '<Primary><Super>d'
add_custom_keybinding 'Open Power Settings' 'gnome-control-center power' '<Control><Super>p'
add_custom_keybinding 'Open WiFi Settings' 'gnome-control-center wifi' '<Control><Super>w'
add_custom_keybinding 'Open Audio Settings' 'gnome-control-center sound' '<Control><Super>a'
add_custom_keybinding 'Open File Explorer' 'nautilus' '<Shift><Super>f'

TOTAL_CUSTOM_KEYBINDINGS=$((${#CUSTOM_NAMES[@]} - 1))
CUSTOM_KEYBINDINGS=""
for i in "${!CUSTOM_NAMES[@]}"; do
  CUSTOM_KEYBINDINGS="$CUSTOM_KEYBINDINGS '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/',"
done
CUSTOM_KEYBINDINGS="[${CUSTOM_KEYBINDINGS%,}]"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$CUSTOM_KEYBINDINGS"

for i in "${!CUSTOM_NAMES[@]}"; do
  KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$KEY_PATH" name "${CUSTOM_NAMES[$i]}"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$KEY_PATH" command "${CUSTOM_COMMANDS[$i]}"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"$KEY_PATH" binding "${CUSTOM_BINDINGS[$i]}"
done

# Lock Screen
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 1800
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Primary><Super><Alt>l']"
