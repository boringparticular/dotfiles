import sys

colors = {
    "1e1e2e": "base00",
    "181825": "base01",
    "313244": "base02",
    "45475a": "base03",
    "585b70": "base04",
    "cdd6f4": "base05",
    "f5e0dc": "base06",
    "b4befe": "base07",
    "f38ba8": "base08",
    "fab387": "base09",
    "f9e2af": "base0A",
    "a6e3a1": "base0B",
    "94e2d5": "base0C",
    "89b4fa": "base0D",
    "cba6f7": "base0E",
    "f2cdcd": "base0F",
}

color_to_base_str = {k: f"{{{{ .theme.palette.{v} }}}}" for k, v in colors.items()}

if len(sys.argv) != 2:
    args = sys.argv[1:]
    print("The script requires one argument which is the file to edit", args)
    exit()

file_path = sys.argv[1]

with open(file_path, 'r+') as f:
    content = f.read()
    f.seek(0)
    for color, tmpl in color_to_base_str.items():
        content = content.replace(color, tmpl)
    f.write(content)
    f.truncate()
