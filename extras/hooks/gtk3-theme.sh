#!/bin/bash
# omarchy:summary=Apply the theme's colors to GTK3 apps (virt-manager, etc.)
#
# ~/.config/omarchy/themed/gtk.css.tpl renders gtk.css into the current theme from its
# colors.toml; this hook installs it as GTK3's user stylesheet. GTK3 apps pick it up
# the next time they start. Edit the template, not ~/.config/gtk-3.0/gtk.css.

THEME="$HOME/.local/state/omarchy/current/theme"
TARGET="$HOME/.config/gtk-3.0/gtk.css"
MARKER="$HOME/.config/gtk-3.0/.theme-managed"

mkdir -p "$(dirname "$TARGET")"

# Only ever replace or remove a gtk.css this hook created, never a hand-written one
if [[ -f $TARGET && ! -f $MARKER ]]; then
  exit 0
fi

if [[ -f $THEME/gtk.css ]]; then
  cp "$THEME/gtk.css" "$TARGET"
  touch "$MARKER"
elif [[ -f $MARKER ]]; then
  rm -f "$TARGET" "$MARKER"
fi
