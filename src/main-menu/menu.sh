#!/bin/bash
echo "╔══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░   ▷  M E N U                                          ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║"
echo "╚════╗ ╔═══════════════════════════════════════════════════════════════════════════════════╝"

echo "${echo_prefix}"
echo -e "${echo_prefix}1) List repositories"
echo -e "${echo_prefix}2) Perform summary analysis"
echo -e "${echo_prefix}3) Perform extended analysis"
echo -e "${echo_prefix}4) Perform single analysis"
echo -e "${echo_prefix}5) Quit"

echo "${echo_prefix}"
read -rp "     ╚═╝ Provide your selection (number): " option

case $option in
  1)
      source "${workspace}/src/list-repositories/list_repositories.sh"
      source "${workspace}/src/main-menu/menu.sh"
      exit
      ;;
  2)
      source "${workspace}/src/analysis/perform_summary_analysis.sh"
      source "${workspace}/src/main-menu/menu.sh"
      exit
      ;;
  3)
      source "${workspace}/src/analysis/perform_extended_analysis.sh"
      source "${workspace}/src/main-menu/menu.sh"
      exit
      ;;
  4)
      source "${workspace}/src/analysis/perform_single_analysis.sh"
      source "${workspace}/src/main-menu/menu.sh"
      exit
      ;;
  5)
      exit
      ;;
  *) # Invalid option
      clear
      source "${workspace}/src/main-menu/menu.sh"
      exit
      ;;
esac