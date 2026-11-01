#!/usr/bin/env python3
"""Map a Solitude Dusk colour file to its Solitude Dawn counterpart.

Usage:
  tools/dawnify.py <dusk eza.yml>  eza.yml
  tools/dawnify.py <dusk vscode theme.json>  extras/vscode/themes/solitude-dawn-color-theme.json

Every Dusk hex colour is swapped for the Dawn colour in the same role; an alpha
suffix (#rrggbbAA) is kept. Text colours in the Dawn column reach at least
4.5:1 contrast on the #f4f0e8 background (comments 4:1, punctuation 3:1).
The script fails if it meets a colour it has no mapping for.
"""
import json
import re
import sys

# dusk -> dawn
MAP = {
    # surfaces
    "171717": "f4f0e8", "121212": "ebe6dc", "0d0d0d": "e2dccf", "1d1d1d": "faf7f1",
    "232323": "e6e0d4", "2d2d2d": "d9d2c4", "3a3530": "ecdcb8", "000000": "000000",
    # text
    "d6d6d6": "2f2c28", "e9e9e9": "1a1816", "bdbec1": "4a463f", "9d9d9d": "6e695f",
    "6b6b6b": "79746b", "5e5e5e": "928a7d", "4a4a4a": "8e8573", "8a8478": "79746b",
    # accent and palette
    "db9617": "965f00", "e8b450": "806400", "d9b36a": "7a5a14", "d9822b": "a45712",
    "c0674a": "a8452a", "d9825f": "a9563b", "9e5540": "a9563b",
    "9ca07a": "64693c", "b5b993": "565b32", "83876a": "6c704c", "6e7158": "6c704c",
    "8ea39d": "4b6b63", "a8bdb7": "3f5f57",
    "8b93a6": "566078", "a6aec0": "4f5970",
    "a38aa0": "83647f", "bca6b9": "7d5c79",
    "674c19": "7a6440", "a8946a": "7a6a45",
}

# VS Code keys whose value is not a colour on the background: shadows and
# opacity masks keep their own values, and the terminal gets a proper light
# ANSI set (black dark, white mid-grey) instead of the mapped dark one.
VSCODE_OVERRIDES = {
    "widget.shadow": "#3a302024",
    "inlineChat.shadow": "#3a302024",
    "scrollbar.shadow": "#3a302018",
    "minimap.foregroundOpacity": "#000000c0",
    "editorUnnecessaryCode.opacity": "#00000080",
    "terminal.ansiBlack": "#2f2c28",
    "terminal.ansiRed": "#a8452a",
    "terminal.ansiGreen": "#64693c",
    "terminal.ansiYellow": "#806400",
    "terminal.ansiBlue": "#566078",
    "terminal.ansiMagenta": "#7d5c79",
    "terminal.ansiCyan": "#4b6b63",
    "terminal.ansiWhite": "#79746b",
    "terminal.ansiBrightBlack": "#5e5a52",
    "terminal.ansiBrightRed": "#a9563b",
    "terminal.ansiBrightGreen": "#6c704c",
    "terminal.ansiBrightYellow": "#8d6a00",
    "terminal.ansiBrightBlue": "#636d82",
    "terminal.ansiBrightMagenta": "#82647f",
    "terminal.ansiBrightCyan": "#58726b",
    "terminal.ansiBrightWhite": "#928a7d",
}


def main(src, dst):
    text = open(src).read()
    missing = set()

    def swap(m):
        base, alpha = m.group(1).lower(), m.group(2) or ""
        if base not in MAP:
            missing.add(base)
            return m.group(0)
        return "#" + MAP[base] + alpha

    out = re.sub(r"#([0-9a-fA-F]{6})([0-9a-fA-F]{2})?\b", swap, text)
    if missing:
        sys.exit("no Dawn colour for: " + ", ".join(sorted(missing)))

    if src.endswith(".json"):
        theme = json.loads(out)
        theme["name"] = "Solitude Dawn"
        theme["type"] = "light"
        theme["colors"].update(VSCODE_OVERRIDES)
        out = json.dumps(theme, indent=2) + "\n"

    open(dst, "w").write(out)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    main(sys.argv[1], sys.argv[2])
