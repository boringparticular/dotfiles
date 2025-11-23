#!/usr/bin/env python3

from pathlib import Path
import sys
import yaml

DATA_DIR = "/home/kmies/.local/share/chezmoi/.chezmoidata"
OUTPUT_FILE_NAME = "30-selected-theme.yaml"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        exit(1)

    path = sys.argv[1]

    theme = None
    with open(path, "r") as f:
        data = f.read()
        theme = yaml.safe_load(data)

        for name, color in theme["palette"].items():
            theme["palette"][name] = color[1:]

    out_path = Path(DATA_DIR).joinpath(OUTPUT_FILE_NAME)
    out_path.write_text(yaml.safe_dump({"theme": theme}))
