/* Omarchy theme colors for GTK3 apps (virt-manager, etc.).
 * Rendered from colors.toml on every `omarchy theme set` and installed to
 * ~/.config/gtk-3.0/gtk.css by hooks/theme-set.d/gtk3-theme.sh. Edit this template, not the output. */

@define-color theme_bg_color {{ background }};
@define-color theme_fg_color {{ foreground }};
@define-color theme_base_color {{ darker_background }};
@define-color theme_text_color {{ foreground }};
@define-color theme_selected_bg_color {{ accent }};
@define-color theme_selected_fg_color {{ darker_background }};
@define-color insensitive_bg_color {{ background }};
@define-color insensitive_fg_color {{ dark_foreground }};
@define-color borders {{ lighter_background }};
@define-color unfocused_borders {{ lighter_background }};
@define-color warning_color {{ yellow }};
@define-color error_color {{ red }};
@define-color success_color {{ green }};
@define-color accent_color {{ accent }};

window, dialog, .background, messagedialog, assistant, popover, .view.dim-label {
  background-color: {{ background }};
  color: {{ foreground }};
}

headerbar, .titlebar, toolbar, menubar, .toolbar, actionbar, statusbar {
  background: {{ darker_background }};
  color: {{ foreground }};
  border-color: {{ lighter_background }};
  box-shadow: none;
}
headerbar:backdrop, .titlebar:backdrop { background: {{ darker_background }}; }

menu, .menu, .context-menu, popover.background, menubar > menuitem > menu {
  background-color: {{ darker_background }};
  color: {{ foreground }};
  border: 1px solid {{ lighter_background }};
}
menuitem:hover, menu menuitem:hover, modelbutton:hover {
  background-color: {{ lighter_background }};
  color: {{ foreground }};
}

treeview.view, iconview, list, row, textview text, .view, scrolledwindow viewport {
  background-color: {{ darker_background }};
  color: {{ foreground }};
}
treeview.view:hover, row:hover { background-color: {{ lighter_background }}; }
treeview.view:selected, treeview.view:selected:focus, row:selected, .view:selected,
iconview:selected, textview text selection, entry selection, label selection {
  background-color: {{ accent }};
  color: {{ darker_background }};
}
treeview.view header button, column-header button {
  background: {{ background }};
  color: {{ light_foreground }};
  border-color: {{ lighter_background }};
}

entry, spinbutton, combobox entry, searchentry {
  background: {{ darker_background }};
  color: {{ foreground }};
  border-color: {{ lighter_background }};
  box-shadow: none;
}
entry:focus, spinbutton:focus { border-color: {{ accent }}; box-shadow: inset 0 0 0 1px {{ accent }}; }

button, combobox button, modelbutton.flat, toolbutton button {
  background: {{ lighter_background }};
  color: {{ foreground }};
  border-color: {{ lighter_background }};
  box-shadow: none;
  text-shadow: none;
  -gtk-icon-shadow: none;
}
button:hover { background: {{ selection }}; border-color: {{ accent }}; }
button:active, button:checked { background: {{ accent }}; color: {{ darker_background }}; }
button.flat, toolbar button, headerbar button { background: transparent; border-color: transparent; }
button.flat:hover, toolbar button:hover, headerbar button:hover { background: {{ lighter_background }}; }
button.suggested-action { background: {{ accent }}; color: {{ darker_background }}; border-color: {{ accent }}; }
button.destructive-action { background: {{ red }}; color: {{ darker_background }}; border-color: {{ red }}; }
button:disabled, entry:disabled { background: {{ background }}; color: {{ dark_foreground }}; }

notebook, notebook > stack:not(:only-child) { background-color: {{ background }}; }
notebook > header { background: {{ darker_background }}; border-color: {{ lighter_background }}; }
notebook > header tab { color: {{ dark_foreground }}; }
notebook > header tab:checked { color: {{ foreground }}; box-shadow: inset 0 -3px {{ accent }}; }

check, radio { background: {{ darker_background }}; border-color: {{ muted }}; color: {{ darker_background }}; }
check:checked, radio:checked { background: {{ accent }}; border-color: {{ accent }}; }
switch { background: {{ lighter_background }}; border-color: {{ lighter_background }}; }
switch:checked { background: {{ accent }}; border-color: {{ accent }}; }
switch slider { background: {{ foreground }}; border-color: {{ lighter_background }}; }

scale trough, progressbar trough, levelbar trough { background: {{ lighter_background }}; border-color: {{ lighter_background }}; }
scale highlight, progressbar progress, levelbar block.filled { background: {{ accent }}; border-color: {{ accent }}; }
scrollbar { background: {{ darker_background }}; border-color: {{ background }}; }
scrollbar slider { background: {{ muted }}; }
scrollbar slider:hover { background: {{ dark_foreground }}; }

frame > border, .frame, separator, paned > separator { border-color: {{ lighter_background }}; background-color: {{ lighter_background }}; }
tooltip, tooltip.background { background: {{ darker_background }}; color: {{ foreground }}; border: 1px solid {{ lighter_background }}; }
infobar.info > revealer > box { background: {{ blue }}; color: {{ darker_background }}; }
infobar.warning > revealer > box { background: {{ yellow }}; color: {{ darker_background }}; }
infobar.error > revealer > box { background: {{ red }}; color: {{ darker_background }}; }
link, *:link { color: {{ blue }}; }
.dim-label, label:disabled { color: {{ dark_foreground }}; }
