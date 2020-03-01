#! /usr/bin/env bash

op() {
    echo "obase=16; x=$((0x$1 $2 0x$3)); if(x<16) print 0; x" | bc
}

h=d5
m=99
l=6d

br=04
bg=06
bb=10

gs() {
    echo "$(op $br + $1)/$(op $bg + $1)/$(op $bb + $1)"
}

base00="$(gs 00)" # Black
base01="$(gs 08)"
base02="$(gs 12)"
base03="$(gs 40)" # Bright black
base04="$(gs 60)"
base05="$(gs B0)" # White
base06="$(gs D0)"
base07="FF/FF/FF" # Base 07 - Bright White
base08="$h/$m/$l" # Base 08 - Red
base09="$h/$h/$l" # Base 09
base0A="$m/$h/$l" # Base 0A - Yellow
base0B="$l/$h/$m" # Base 0B - Green
base0C="$l/$m/$h" # Base 0C - Cyan
base0D="$m/$l/$h" # Base 0D - Blue
base0E="$h/$l/$m" # Base 0E - Magenta
base0F="$h/$l/$l" # Base 0F

# # Used to update vim
# echo "\\  '00' : '#${base00//\//}',"
# echo "\\  '01' : '#${base01//\//}',"
# echo "\\  '02' : '#${base02//\//}',"
# echo "\\  '03' : '#${base03//\//}',"
# echo "\\  '04' : '#${base04//\//}',"
# echo "\\  '05' : '#${base05//\//}',"
# echo "\\  '06' : '#${base06//\//}',"
# echo "\\  '07' : '#${base07//\//}',"
# echo "\\  '08' : '#${base08//\//}',"
# echo "\\  '09' : '#${base09//\//}',"
# echo "\\  '0A' : '#${base0A//\//}',"
# echo "\\  '0B' : '#${base0B//\//}',"
# echo "\\  '0C' : '#${base0C//\//}',"
# echo "\\  '0D' : '#${base0D//\//}',"
# echo "\\  '0E' : '#${base0E//\//}',"
# echo "\\  '0F' : '#${base0F//\//}',"

color00=$base00 # Black
color01=$base08 # Red
color02=$base0B # Green
color03=$base0A # Yellow
color04=$base0D # Blue
color05=$base0E # Magenta
color06=$base0C # Cyan
color07=$base05 # White
color08=$base03 # Bright Black
color09=$base08 # Bright Red
color10=$base0B # Bright Green
color11=$base0A # Bright Yellow
color12=$base0D # Bright Blue
color13=$base0E # Bright Magenta
color14=$base0C # Bright Cyan
color15=$base07 # Bright White
color16=$base09
color17=$base0F
color18=$base01
color19=$base02
color20=$base04
color21=$base06
color_foreground=$base05
color_background=$base00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template()        { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var()    { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template()        { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var()    { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template()        { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var()    { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
    base00p=${base00///}
    base02p=${base02///}
    base05p=${base05///}

    # iTerm2 proprietary escape codes
    put_template_custom "1337;SetColors=fg=$base05p"
    put_template_custom "1337;SetColors=bg=$base00p"
    put_template_custom "1337;SetColors=bold=$base05p"
    put_template_custom "1337;SetColors=selbg=$base02p"
    put_template_custom "1337;SetColors=selfg=$base05p"
    put_template_custom "1337;SetColors=curbg=$base05p"
    put_template_custom "1337;SetColors=curfg=$base00p"

    put_template_custom "6;1;bg;red;brightness;5"
    put_template_custom "6;1;bg;green;brightness;16"
    put_template_custom "6;1;bg;blue;brightness;24"
    # put_template_custom "\033]6;1;bg;red;brightness;0\a"
    # put_template_custom "\033]6;1;bg;green;brightness;30\a"
    # put_template_custom "\033]6;1;bg;blue;brightness;60\a"
else
    put_template_var 10 $color_foreground
    if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
        put_template_var 11 $color_background
        if [ "${TERM%%-*}" = "rxvt" ]; then
            put_template_var 708 $color_background # internal border (rxvt)
        fi
    fi
    put_template_custom 12 ";7" # cursor (reverse video)
fi
