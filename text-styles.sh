#!/usr/bin/env bash

ESC="$(printf '\033[')"
RESET="${ESC}0m"

# Basic colors (adjust or expand as needed)
BOLD="${ESC}1m"
DIM="${ESC}2m"
BLUE="${ESC}34m"
CYAN="${ESC}36m"
MAGENTA="${ESC}35m"
YELLOW="${ESC}33m"
GREEN="${ESC}32m"
RED="${ESC}31m"
GRAY="${ESC}90m"

hr_thin() {
  printf "%s----------------------------------------%s\n" "${GRAY}" "${RESET}"
}

hr_thick() {
  printf "%s========================================%s\n" "${BOLD}" "${RESET}"
}

hr_box() {
  printf "%s┌──────────────────────────────────────┐%s\n" "${BOLD}" "${RESET}"
}

title() {
  # Center-ish title line inside a wide bar
  local text="$1"
  hr_thick
  printf "%s%s%s\n" "${BOLD}${CYAN}" "${text}" "${RESET}"
  hr_thick
  printf "\n"
}

section() {
  local text="$1"
  printf "\n%s[%s]%s %s%s\n" "${BOLD}${BLUE}" "${RESET}${BOLD}${CYAN}" "${BOLD}${BLUE}" "${RESET}" "${text}"
  hr_thin
}

echo
title "TERMINAL DECOR EXAMPLES"

###############################################################################
# 1. SIMPLE HEADERS & DIVIDERS
###############################################################################
section "Simple headers and dividers"

echo -e "${BOLD}Plain header line${RESET}"
hr_thin

echo -e "${BOLD}${CYAN}Thick emphasized divider below:${RESET}"
hr_thick

echo

###############################################################################
# 2. BOXED TITLES (UNICODE BOX DRAWING)
###############################################################################
section "Boxed titles"

echo -e "${BOLD}${CYAN}Single-line box:${RESET}"
echo -e "${BOLD}┌───────────────────────────────┐${RESET}"
echo -e "${BOLD}│        SAMPLE TITLE           │${RESET}"
echo -e "${BOLD}└───────────────────────────────┘${RESET}"

echo

echo -e "${BOLD}${MAGENTA}Double-line box:${RESET}"
echo -e "${BOLD}╔═══════════════════════════════╗${RESET}"
echo -e "${BOLD}║        SAMPLE HEADER          ║${RESET}"
echo -e "${BOLD}╚═══════════════════════════════╝${RESET}"

echo

###############################################################################
# 3. STATUS TAGS / LABELS
###############################################################################
section "Status labels"

echo -e "${BOLD}${GREEN}[OK]${RESET}        Operation completed"
echo -e "${BOLD}${YELLOW}[WARN]${RESET}      Check configuration"
echo -e "${BOLD}${RED}[ERROR]${RESET}     Action failed"
echo -e "${BOLD}${CYAN}[INFO]${RESET}      Informational message"

echo

echo -e "${BOLD}${GREEN}✅ SUCCESS${RESET}   Task finished"
echo -e "${BOLD}${YELLOW}⚠️  WARNING${RESET}   Potential issue"
echo -e "${BOLD}${RED}❌ FAILURE${RESET}    Task failed"
echo -e "${BOLD}${CYAN}ℹ️  INFO${RESET}       General notice"

echo

###############################################################################
# 4. SIMPLE ASCII TABLE
###############################################################################
section "ASCII table (portable)"

echo "+------------+----------------------+"
printf "| %-10s | %-20s |\n" "ITEM" "STATUS"
echo "+------------+----------------------+"
printf "| %-10s | %-20s |\n" "task-1" "OK"
printf "| %-10s | %-20s |\n" "task-2" "PENDING"
printf "| %-10s | %-20s |\n" "task-3" "FAILED"
echo "+------------+----------------------+"

echo

###############################################################################
# 5. UNICODE TABLE WITH BORDERS
###############################################################################
section "Unicode table with borders"

echo -e "${BOLD}╔════════════╦══════════════════════╗${RESET}"
printf "${BOLD}║ %-10s ║ %-20s ║${RESET}\n" "SERVICE" "STATE"
echo -e "${BOLD}╠════════════╬══════════════════════╣${RESET}"
printf "${BOLD}║ %-10s ║ %-20s ║${RESET}\n" "web" "RUNNING"
printf "${BOLD}║ %-10s ║ %-20s ║${RESET}\n" "db" "RUNNING"
printf "${BOLD}║ %-10s ║ %-20s ║${RESET}\n" "cache" "DEGRADED"
echo -e "${BOLD}╚════════════╩══════════════════════╝${RESET}"

echo

###############################################################################
# 6. SUMMARY BOX (INFO PANEL)
###############################################################################
section "Summary/info box"

echo -e "${BOLD}┌──────────────────────────────────────┐${RESET}"
echo -e "${BOLD}│ SUMMARY                              │${RESET}"
echo -e "${BOLD}├──────────────────────────────────────┤${RESET}"
echo -e "│ Total tasks : 3                      │"
echo -e "│ Success     : 2                      │"
echo -e "│ Failed      : 1                      │"
echo -e "${BOLD}└──────────────────────────────────────┘${RESET}"

echo

###############################################################################
# 7. PROGRESS BARS (TEXT-BASED)
###############################################################################
section "Progress bars"

bar_full="██████████"
bar_half="█████─────"
bar_steps="███░░░░░░░░"

echo -e "${BOLD}Progress 100%:${RESET} [${GREEN}${bar_full}${RESET}]"
echo -e "${BOLD}Progress  50%:${RESET} [${YELLOW}${bar_half}${RESET}]"
echo -e "${BOLD}Progress  30%:${RESET} [${CYAN}${bar_steps}${RESET}]"

echo

###############################################################################
# 8. KEY-VALUE LISTS / ALIGNMENT
###############################################################################
section "Key / value alignment"

printf "%-18s : %s\n" "Host" "example.local"
printf "%-18s : %s\n" "Environment" "production"
printf "%-18s : %s\n" "Deployed version" "1.2.3"
printf "%-18s : %s\n" "Last run" "2025-11-11 12:34:56"

echo

###############################################################################
# 9. CALLOUT BLOCKS
###############################################################################
section "Callout blocks"

# Info callout
echo -e "${BOLD}${CYAN}┌─ INFO ─────────────────────────────┐${RESET}"
echo -e "│ Use this area for general notes.   │"
echo -e "${BOLD}${CYAN}└────────────────────────────────────┘${RESET}"

echo

# Warning callout
echo -e "${BOLD}${YELLOW}┌─ WARNING ──────────────────────────┐${RESET}"
echo -e "│ Review settings before continuing. │"
echo -e "${BOLD}${YELLOW}└────────────────────────────────────┘${RESET}"

echo

# Error callout
echo -e "${BOLD}${RED}┌─ ERROR ────────────────────────────┐${RESET}"
echo -e "│ One or more actions have failed.   │"
echo -e "${BOLD}${RED}└────────────────────────────────────┘${RESET}"

echo

###############################################################################
# 10. MINI DASHBOARD EXAMPLE
###############################################################################
section "Mini dashboard example"

echo -e "${BOLD}${MAGENTA}SYSTEM STATUS${RESET}"
hr_thin
printf " %-15s %s\n" "Core services"     "${GREEN}OK${RESET}"
printf " %-15s %s\n" "Background jobs"   "${YELLOW}DEGRADED${RESET}"
printf " %-15s %s\n" "External APIs"     "${GREEN}OK${RESET}"
printf " %-15s %s\n" "Last check"        "2025-11-11 12:00:00"
hr_thin

echo

###############################################################################
# END
###############################################################################
echo -e "${BOLD}${GREEN}Demo complete.${RESET} Customize these patterns for your own scripts."
echo
