#!/usr/bin/env bash

# Displays ANSI color and text style codes for terminal scripting reference

ESC="$(printf '\033[')"
RESET="${ESC}0m"

hr() {
  printf "\n${ESC}1;37m==================================================${RESET}\n\n"
}

title() {
  printf "${ESC}1;36m%s${RESET}\n" "$1"
}

subtitle() {
  printf "${ESC}1;34m%s${RESET}\n" "$1"
}

hr
title "ANSI COLOR & TEXT STYLE DEMO"

###############################################################################
# BASIC TEXT COLORS (30-37)
###############################################################################
subtitle "Basic text colors (30-37)"
for code in 30 31 32 33 34 35 36 37; do
  printf "%s%smCode %2s%s  Sample text\n" "${ESC}" "${code}m" "${code}" "${RESET}"
done

###############################################################################
# BRIGHT TEXT COLORS (90-97)
###############################################################################
printf "\n"
subtitle "Bright text colors (90-97)"
for code in 90 91 92 93 94 95 96 97; do
  printf "%s%smCode %3s%s  Bright sample text\n" "${ESC}" "${code}m" "${code}" "${RESET}"
done

###############################################################################
# BASIC BACKGROUND COLORS (40-47)
###############################################################################
printf "\n"
subtitle "Background colors (40-47)"
for code in 40 41 42 43 44 45 46 47; do
  printf "%s%smCode %2s%s  Background sample      %s\n" "${ESC}" "${code}m" "${code}" "${RESET}" "${RESET}"
done

###############################################################################
# BRIGHT BACKGROUND COLORS (100-107)
###############################################################################
printf "\n"
subtitle "Bright background colors (100-107)"
for code in 100 101 102 103 104 105 106 107; do
  printf "%s%smCode %3s%s  Bright background sample%s\n" "${ESC}" "${code}m" "${code}" "${RESET}" "${RESET}"
done

###############################################################################
# TEXT STYLES
###############################################################################
hr
subtitle "Text styles"
printf "${ESC}0mNormal (0)${RESET}\n"
printf "${ESC}1mBold (1)${RESET}\n"
printf "${ESC}2mDim (2)${RESET}\n"
printf "${ESC}3mItalic (3)${RESET} (support depends on terminal)\n"
printf "${ESC}4mUnderline (4)${RESET}\n"
printf "${ESC}5mBlink (5)${RESET} (often not supported / disabled)\n"
printf "${ESC}7mInverse (7)${RESET}\n"
printf "${ESC}8mHidden (8)${RESET} (invisible text)\n"
printf "${ESC}9mStrikethrough (9)${RESET}\n"

###############################################################################
# COMBINED EXAMPLES
###############################################################################
printf "\n"
subtitle "Combined examples"
printf "${ESC}1;32mBold green${RESET}\n"
printf "${ESC}1;31mBold red${RESET}\n"
printf "${ESC}1;33mBold yellow${RESET}\n"
printf "${ESC}1;36mBold cyan${RESET}\n"
printf "${ESC}1;4;34mBold underlined blue${RESET}\n"
printf "${ESC}1;35mBold magenta${RESET}\n"
printf "${ESC}7;31mInverse red (7;31)${RESET}\n"
printf "${ESC}1;97;44mBold white on blue background${RESET}\n"

###############################################################################
# 256-COLOR PALETTE (FOREGROUND)
###############################################################################
hr
subtitle "256-color palette (foreground, 38;5;Xm)"
printf "This may be wide; resize your terminal if needed.\n\n"

for ((i=0; i<256; i++)); do
  # Group colors in rows of 16 for readability
  if (( i % 16 == 0 )); then
    printf "\n"
  fi
  printf "%s38;5;%sm%3d%s " "${ESC}" "${i}" "${i}" "${RESET}"
done

printf "\n\n"

###############################################################################
# 256-COLOR PALETTE (BACKGROUND)
###############################################################################
subtitle "256-color palette (background, 48;5;Xm)"
printf "Background swatches:\n\n"

for ((i=0; i<256; i++)); do
  if (( i % 16 == 0 )); then
    printf "\n"
  fi
  printf "%s48;5;%sm%3d%s " "${ESC}" "${i}" "${i}" "${RESET}"
done

printf "\n\n"

###############################################################################
# TRUECOLOR (24-bit RGB) EXAMPLES
###############################################################################
hr
subtitle "Truecolor (24-bit RGB) examples (38;2;R;G;Bm)"
printf "These work if your terminal supports truecolor (most modern terminals do).\n\n"

rgb() {
  r="$1"; g="$2"; b="$3"; text="$4"
  printf "%s38;2;%s;%s;%sm%s%s\n" "${ESC}" "${r}" "${g}" "${b}" "${text}" "${RESET}"
}

rgb 255 0   0   "RGB(255, 0, 0)   → Red"
rgb 0   255 0   "RGB(0, 255, 0)   → Green"
rgb 0   0   255 "RGB(0, 0, 255)   → Blue"
rgb 255 255 0   "RGB(255, 255, 0) → Yellow"
rgb 255 105 180 "RGB(255,105,180) → Hot Pink"
rgb 0   255 255 "RGB(0,255,255)   → Cyan"
rgb 255 165 0   "RGB(255,165,0)   → Orange"
rgb 128 0   128 "RGB(128,0,128)   → Purple"
rgb 200 200 200 "RGB(200,200,200) → Light Gray"
rgb 32  32  32  "RGB(32,32,32)    → Almost black"

###############################################################################
# STYLE + TRUECOLOR COMBOS
###############################################################################
printf "\n"
subtitle "Combined style + truecolor examples"
printf "${ESC}1;38;2;0;255;180mBold teal-ish accent${RESET}\n"
printf "${ESC}4;38;2;255;215;0mUnderlined gold accent${RESET}\n"
printf "${ESC}1;7;38;2;255;105;180mBold inverted hot pink banner${RESET}\n"

###############################################################################
# END
###############################################################################
hr
printf "${ESC}1;32mDone.${RESET} Use these codes to define your own ${ESC}1mGREEN/RED/YELLOW/BLUE/CYAN/MAGENTA${RESET} variables in scripts.\n\n"
