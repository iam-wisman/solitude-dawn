/* Omarchy theme colors for GTK4 and libadwaita apps (Nautilus, Settings, Loupe, etc.).
 * Rendered from colors.toml on every `omarchy theme set` and installed to
 * ~/.config/gtk-4.0/gtk.css by hooks/theme-set.d/gtk4-theme.sh. Edit this template, not the output.
 *
 * Surfaces are mixed toward the foreground, so they lift the same way in light and dark themes. */

:root {
  --accent-color: {{ accent }};
  --accent-bg-color: {{ accent }};
  --accent-fg-color: {{ background }};

  --destructive-color: {{ red }};
  --destructive-bg-color: {{ red }};
  --destructive-fg-color: {{ background }};
  --success-color: {{ green }};
  --success-bg-color: {{ green }};
  --success-fg-color: {{ background }};
  --warning-color: {{ yellow }};
  --warning-bg-color: {{ yellow }};
  --warning-fg-color: {{ background }};
  --error-color: {{ red }};
  --error-bg-color: {{ red }};
  --error-fg-color: {{ background }};

  --window-bg-color: {{ background }};
  --window-fg-color: {{ foreground }};
  --view-bg-color: {{ background }};
  --view-fg-color: {{ foreground }};

  --headerbar-bg-color: {{ dark_background }};
  --headerbar-fg-color: {{ foreground }};
  --headerbar-border-color: {{ foreground }};
  --headerbar-backdrop-color: {{ background }};

  --sidebar-bg-color: {{ dark_background }};
  --sidebar-fg-color: {{ foreground }};
  --sidebar-backdrop-color: {{ background }};
  --sidebar-border-color: {{ mix dark_background foreground 12% }};
  --secondary-sidebar-bg-color: {{ mix dark_background background 50% }};
  --secondary-sidebar-fg-color: {{ foreground }};
  --secondary-sidebar-backdrop-color: {{ background }};
  --secondary-sidebar-border-color: {{ mix dark_background foreground 12% }};

  --card-bg-color: {{ mix background foreground 5% }};
  --card-fg-color: {{ foreground }};
  --thumbnail-bg-color: {{ mix background foreground 5% }};
  --thumbnail-fg-color: {{ foreground }};
  --overview-bg-color: {{ dark_background }};
  --overview-fg-color: {{ foreground }};
  --active-toggle-bg-color: {{ mix background foreground 12% }};
  --active-toggle-fg-color: {{ foreground }};

  --dialog-bg-color: {{ background }};
  --dialog-fg-color: {{ foreground }};
  --popover-bg-color: {{ mix background foreground 3% }};
  --popover-fg-color: {{ foreground }};
}

/* Named colours for GTK4 apps that don't use libadwaita, and older libadwaita CSS */
@define-color accent_color {{ accent }};
@define-color accent_bg_color {{ accent }};
@define-color accent_fg_color {{ background }};
@define-color destructive_color {{ red }};
@define-color destructive_bg_color {{ red }};
@define-color destructive_fg_color {{ background }};
@define-color success_color {{ green }};
@define-color warning_color {{ yellow }};
@define-color error_color {{ red }};
@define-color window_bg_color {{ background }};
@define-color window_fg_color {{ foreground }};
@define-color view_bg_color {{ background }};
@define-color view_fg_color {{ foreground }};
@define-color headerbar_bg_color {{ dark_background }};
@define-color headerbar_fg_color {{ foreground }};
@define-color headerbar_backdrop_color {{ background }};
@define-color sidebar_bg_color {{ dark_background }};
@define-color sidebar_fg_color {{ foreground }};
@define-color card_bg_color {{ mix background foreground 5% }};
@define-color card_fg_color {{ foreground }};
@define-color dialog_bg_color {{ background }};
@define-color dialog_fg_color {{ foreground }};
@define-color popover_bg_color {{ mix background foreground 3% }};
@define-color popover_fg_color {{ foreground }};
@define-color theme_bg_color {{ background }};
@define-color theme_fg_color {{ foreground }};
@define-color theme_base_color {{ background }};
@define-color theme_text_color {{ foreground }};
@define-color theme_selected_bg_color {{ accent }};
@define-color theme_selected_fg_color {{ background }};

/* Text selection in entries and text views */
selection, text selection, label selection {
  background-color: {{ selection }};
  color: {{ bright_foreground }};
}
