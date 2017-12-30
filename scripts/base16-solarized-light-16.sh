#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Solarized Dark scheme by Ethan Schoonover (http://ethanschoonover.com/solarized)

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

base03="00/2b/36"
base02="07/36/42"
base01="58/6e/75"
base00="65/7b/83"
base0="83/94/96"
base1="93/a1/a1"
base2="ee/e8/d5"
base3="fd/f6/e3"

black=$base3
white=$base00

yellow="b5/89/00"
orange="cb/4b/16"
red="dc/32/2f"
magenta="d3/36/82"
violet="6c/71/c4"
blue="26/8b/d2"
cyan="2a/a1/98"
green="85/99/00"

# light
base16_00=$base3
base16_01=$base2
base16_02=$base1
base16_03=$base0
base16_04=$base01
base16_05=$base00
base16_06=$base02
base16_07=$base03

bright_red=$orange
bright_cyan=$violet


_base16_00=$( echo $base16_00 | sed 's|/||g' )
_base16_01=$( echo $base16_01 | sed 's|/||g' )
_base16_02=$( echo $base16_02 | sed 's|/||g' )
_base16_03=$( echo $base16_03 | sed 's|/||g' )
_base16_04=$( echo $base16_04 | sed 's|/||g' )
_base16_05=$( echo $base16_05 | sed 's|/||g' )
_base16_06=$( echo $base16_06 | sed 's|/||g' )
_base16_07=$( echo $base16_07 | sed 's|/||g' )

# base16 layout dark
color00=$base16_00   # Black
color01=$base16_08   # Red
color02=$base16_0B   # Green
color03=$base16_0A   # Yellow
color04=$base16_0D   # Blue
color05=$base16_0E   # Magenta
color06=$base16_0C   # Cyan
color07=$base16_05   # White

color08=$base16_03   # Bright Black
color09=$base16_09   # Bright Red (Orange)
color10=$base16_01   # Bright Green
color11=$base16_02   # Bright Yellow
color12=$base16_04   # Bright Blue
color13=$base16_06   # Bright Magenta
color14=$base16_0F   # Bright Cyan
color15=$base16_07   # Bright White

# solarized layout dark
# color00=$base02   # Black, base16_01
# color01=$red      # Red, base16_08
# color02=$green    # Green, base16_0B
# color03=$yellow   # Yellow, base16_0A
# color04=$blue     # Blue, base16_0D
# color05=$magenta  # Magenta, base16_0F
# color06=$cyan     # Cyan, base16_0C
# color07=$base2    # White, base16_06

# color08=$base03   # Bright Black, base16_00
# color09=$orange   # Bright Red (Orange), base16_09
# color10=$base01   # Bright Green, base16_02
# color11=$base00   # Bright Yellow, base16_03
# color12=$base0    # Bright Blue, base16_05
# color13=$violet   # Bright Magenta (Violet), base16_0E
# color14=$base1    # Bright Cyan, base16_04
# color15=$base3    # Bright White, base16_07

color_foreground=$color07   # White
color_background=$color00   # Black
color_cursor=$color07       # White

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
    printf $printf_template_custom Pg $_base16_04 # forground
    printf $printf_template_custom Ph $_base16_00 # background
    printf $printf_template_custom Pi $_base16_04 # bold color
    printf $printf_template_custom Pj $_base16_02 # selection color
    printf $printf_template_custom Pk $_base16_04 # selected text color
    printf $printf_template_custom Pl $_base16_04 # cursor
    printf $printf_template_custom Pm $_base16_00 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    printf $printf_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      printf $printf_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color_foreground
unset color_background
unset color_cursor
