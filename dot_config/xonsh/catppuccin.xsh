# Catppuccin Mocha Colors
ROSEWATER = "#{{ .theme.palette.base06 }}"
FLAMINGO = "#{{ .theme.palette.base0F }}"
PINK = "#f5c2e7"
MAUVE = "#{{ .theme.palette.base0E }}"
RED = "#{{ .theme.palette.base08 }}"
MAROON = "#eba0ac"
PEACH = "#{{ .theme.palette.base09 }}"
YELLOW = "#{{ .theme.palette.base0A }}"
GREEN = "#{{ .theme.palette.base0B }}"
TEAL = "#{{ .theme.palette.base0C }}"
SKY = "#89dceb"
SAPPHIRE = "#74c7ec"
BLUE = "#{{ .theme.palette.base0D }}"
LAVENDER = "#{{ .theme.palette.base07 }}"
TEXT = "#{{ .theme.palette.base05 }}"
SUBTEXT1 = "#bac2de"
SUBTEXT0 = "#a6adc8"
OVERLAY2 = "#9399b2"
OVERLAY1 = "#7f849c"
OVERLAY0 = "#6c7086"
SURFACE2 = "#{{ .theme.palette.base04 }}"
SURFACE1 = "#{{ .theme.palette.base03 }}"
SURFACE0 = "#{{ .theme.palette.base02 }}"
BASE = "#{{ .theme.palette.base00 }}"
MANTLE = "#{{ .theme.palette.base01 }}"
CRUST = "#11111b"

CYAN = TEAL
BLACK = CRUST
PURPLE = MAUVE
WHITE = TEXT

BOLD_RED = f'bold {RED}'
BOLD_BLUE = f'bold {BLUE}'
BOLD_CYAN = f'bold {CYAN}'
BOLD_GREEN = f'bold {GREEN}'
BOLD_PURPLE = f'bold {PURPLE}'
BOLD_YELLOW = f'bold {YELLOW}'
BOLD_WHITE = f'bold {WHITE}'

INTENSE_BLACK = BLACK
INTENSE_BLUE = BLUE
INTENSE_CYAN = CYAN
INTENSE_GREEN = GREEN
INTENSE_PURPLE = PURPLE
INTENSE_RED = RED
INTENSE_WHITE = WHITE
INTENSE_YELLOW = YELLOW

BACKGROUND_BLACK = BASE

XONSH_COLOR_STYLE = {
  'RED': RED,
  'BLUE': BLUE,
  'CYAN': CYAN,
  'BLACK': BLACK,
  'GREEN': GREEN,
  'PURPLE': PURPLE,
  'WHITE': WHITE,
  'YELLOW': YELLOW,

  'BOLD_BLUE': BOLD_BLUE,
  'BOLD_CYAN': BOLD_CYAN,
  'BOLD_GREEN': BOLD_GREEN,
  'BOLD_PURPLE': BOLD_PURPLE,
  'BOLD_RED': BOLD_RED,
  'BOLD_YELLOW': BOLD_YELLOW,

  'INTENSE_BLACK': INTENSE_BLACK,
  'INTENSE_BLUE': INTENSE_BLUE,
  'INTENSE_CYAN': INTENSE_CYAN,
  'INTENSE_GREEN': INTENSE_GREEN,
  'INTENSE_PURPLE': INTENSE_PURPLE,
  'INTENSE_RED': INTENSE_RED,
  'INTENSE_WHITE': INTENSE_WHITE,
  'INTENSE_YELLOW': INTENSE_YELLOW,

  'BACKGROUND_BLACK': BACKGROUND_BLACK,

  'Token.Comment': OVERLAY2,
  'Token.Error': RED,
  'Token.Literal.Number': PEACH,
  'Token.Literal.String': GREEN,
  'Token.Literal.String.Char': TEAL,
  'Token.Literal.String.Regex': MAUVE,
  'Token.Literal.String.Escape': MAUVE,
  'Token.Operator': SKY,
  'Token.Operator.Word': SKY,
  'Token.Name.Function': BLUE,
  'Token.Keyword': MAUVE,
  'Token.Literal': MAUVE,
  'Token.Name.Namespace': WHITE,

  # 'Token.Name': ROSEWATER,
  # 'Token.Name.Class': YELLOW,
  # 'Token.Name.Variable': GREEN,
  # 'Token.Name.Variable.Class': GREEN,
  # 'Token.Name.Variable.Global': RED,
  # 'Token.Name.Variable.Instance': BLUE,
  # 'Token.Name.Variable.Magic': YELLOW,
  # 'Token.Name.Builtin': LAVENDER,
  # 'Token.Escape': WHITE,
  # 'Token.Generic': MAROON,
  # 'Token.Generic.Deleted': RED,
  # 'Token.Generic.Emph': WHITE,
  # 'Token.Generic.EmphStrong': BOLD_WHITE,
  # 'Token.Generic.Error': WHITE,
  # 'Token.Generic.Heading': WHITE,
  # 'Token.Generic.Inserted': GREEN,
  # 'Token.Generic.Output': CYAN,
  # 'Token.Generic.Prompt': BOLD_RED,
  # 'Token.Generic.Strong': BOLD_WHITE,
  # 'Token.Generic.Subheading': SURFACE2,
  # 'Token.Generic.Traceback': WHITE,
  # 'Token.Generic.Whitespace': WHITE,
  # 'Token.Keyword.Constant': PEACH,
  # 'Token.Keyword.Declaration': CYAN,
  # 'Token.Keyword.Pseudo': CYAN,
  # 'Token.Keyword.Reserved': CYAN,
  # 'Token.Keyword.Type': CYAN,
  # 'Token.Literal.Date': INTENSE_YELLOW,
  # 'Token.Name.Attribute': INTENSE_GREEN,
  # 'Token.Name.Builtin.Pseudo': WHITE,
  # 'Token.Name.Constant': CYAN,
  # 'Token.Name.Decorator': INTENSE_GREEN,
  # 'Token.Name.Entity': WHITE,
  # 'Token.Name.Exception': MAUVE,
  # 'Token.Name.Function.Magic': INTENSE_GREEN,
  # 'Token.Name.Label': LAVENDER,
  # 'Token.Name.Other': INTENSE_GREEN,
  # 'Token.Name.Property': GREEN,
  # 'Token.Name.Tag': RED,
  # 'Token.Other': TEAL,
  # 'Token.Punctuation': RED,
  # 'Token.Punctuation.Marker': SKY,
  # 'Token.Text': WHITE,
  # 'Token.PTK.Aborting': OVERLAY2,
  # 'Token.PTK.Autosuggestion': GREEN,
  # 'Token.PTK.CompletionMenu': RED,
  # 'Token.PTK.CompletionMenu.Completion': OVERLAY2,
  # 'Token.PTK.CompletionMenu.Completion.Current': TEXT,
  # 'Token.PTK.Scrollbar.Arrow': TEAL,
  # 'Token.PTK.Scrollbar.Background': MANTLE,
  # 'Token.PTK.Scrollbar.Button': RED,
}

from xonsh.tools import register_custom_style
register_custom_style('catppuccin-mocha', XONSH_COLOR_STYLE, base='monokai')
