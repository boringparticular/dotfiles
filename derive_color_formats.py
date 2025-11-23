#!/usr/bin/env python3

from pathlib import Path
import json
import yaml
import tomllib

DATA_DIR = "/home/kmies/.local/share/chezmoi/.chezmoidata"
OUTPUT_FILE_NAME = "50-derived-color-formats.yaml"


def merge_palettes():
    pass


def make_base24(palette):
    palette["base10"] = palette.get("base10", palette["base00"])
    palette["base11"] = palette.get("base11", palette["base00"])
    palette["base12"] = palette.get("base12", palette["base08"])
    palette["base13"] = palette.get("base13", palette["base0A"])
    palette["base14"] = palette.get("base14", palette["base0B"])
    palette["base15"] = palette.get("base15", palette["base0C"])
    palette["base16"] = palette.get("base16", palette["base0D"])
    palette["base17"] = palette.get("base17", palette["base0E"])

    return palette


def add_mnemonics(palette):
    palette["red"] = palette["base08"]
    palette["orange"] = palette["base09"]
    palette["yellow"] = palette["base0A"]
    palette["green"] = palette["base0B"]
    palette["cyan"] = palette["base0C"]
    palette["blue"] = palette["base0D"]
    palette["magenta"] = palette["base0E"]
    palette["brown"] = palette["base0F"]

    palette["bright-red"] = palette["base08"]
    palette["bright-yellow"] = palette["base0A"]
    palette["bright-green"] = palette["base0B"]
    palette["bright-cyan"] = palette["base0C"]
    palette["bright-blue"] = palette["base0D"]
    palette["bright-magenta"] = palette["base0E"]

    return palette


def generate_derived_formats(palette):
    for name, color in dict(palette).items():
        hex = color
        hex_r = hex[0:2]
        hex_g = hex[2:4]
        hex_b = hex[4:6]
        rgb_r = int(hex_r, 16)
        rgb_g = int(hex_g, 16)
        rgb_b = int(hex_b, 16)
        palette[f"{name}_hex"] = hex
        palette[f"{name}_hex_r"] = hex_r
        palette[f"{name}_hex_g"] = hex_g
        palette[f"{name}_hex_b"] = hex_b
        palette[f"{name}_hex_bgr"] = hex_b + hex_g + hex_r
        palette[f"{name}_rgb_r"] = rgb_r
        palette[f"{name}_rgb_g"] = rgb_g
        palette[f"{name}_rgb_b"] = rgb_b
        palette[f"{name}_dec_r"] = round(rgb_r / 256, 6)
        palette[f"{name}_dec_g"] = round(rgb_g / 256, 6)
        palette[f"{name}_dec_b"] = round(rgb_b / 256, 6)

    return palette


if __name__ == "__main__":
    data_dir = Path(DATA_DIR)
    data_files = []
    for p in data_dir.iterdir():
        if not p.is_file():
            continue

        if not p.suffix in [".json", ".yaml", ".toml"]:
            continue

        if p.name == OUTPUT_FILE_NAME:
            continue

        data_files.append(p)

    data_files.sort()

    palette = {}
    for data_file in data_files:
        p = {}
        d = {}
        data = data_file.read_text()

        if data_file.suffix == ".json":
            d = json.loads(data)
        elif data_file.suffix == ".yaml":
            d = yaml.safe_load(data)
        elif data_file.suffix == ".toml":
            d = tomllib.loads(data)

        p = d.get("theme", {}).get("palette", {})
        palette = palette | p

    merge_palettes()
    palette = make_base24(palette)
    palette = add_mnemonics(palette)
    palette = generate_derived_formats(palette)

    out_path = data_dir.joinpath(OUTPUT_FILE_NAME)
    out_path.write_text(yaml.safe_dump({"theme": {"palette": palette}}))
