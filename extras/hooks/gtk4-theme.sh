#!/bin/bash
# omarchy:summary=Apply the theme's colors to GTK4 and libadwaita apps (Nautilus, Settings, etc.)
#
# ~/.config/omarchy/themed/gtk4.css.tpl renders gtk4.css into the current theme from its
# colors.toml; this hook installs it as GTK4's user stylesheet, which libadwaita apps load
# on top of their light or dark style (Omarchy sets that from the theme's mode). Running
# apps pick it up the next time they start. Edit the template, not ~/.config/gtk-4.0/gtk.css.

THEME="$HOME/.local/state/omarchy/current/theme"
TARGET="$HOME/.config/gtk-4.0/gtk.css"
MARKER="$HOME/.config/gtk-4.0/.theme-managed"

mkdir -p "$(dirname "$TARGET")"

# Only ever replace or remove a gtk.css this hook created, never a hand-written one
if [[ -f $TARGET && ! -f $MARKER ]]; then
  exit 0
fi

if [[ -f $THEME/gtk4.css ]]; then
  cp "$THEME/gtk4.css" "$TARGET"
  touch "$MARKER"
elif [[ -f $MARKER ]]; then
  rm -f "$TARGET" "$MARKER"
fi
