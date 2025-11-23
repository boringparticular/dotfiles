#!/usr/bin/env python3

import sys
import yaml


def read_color_scheme(path):
    with open(path, "r") as f:
        data = f.read()
        data = yaml.safe_load(data)
        palette = data["palette"]

        for name, color in palette.items():
            print(f"{name:>4}: {block(name, color[1:])} {color}")


def block(name, color):
    return f"\033[48;2;{int(color[0:2], 16)};{int(color[2:4], 16)};{int(color[4:6], 16)}m       \033[0m"


if __name__ == "__main__":
    path = sys.argv[1]
    read_color_scheme(path)
