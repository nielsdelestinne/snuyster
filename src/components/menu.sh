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
read -rp "     ╚═╝ Make your selection (number): " option

case $option in
  1)
      source "${workspace}/src/components/list_repositories.sh"
      source "${workspace}/src/components/menu.sh"
      break
      ;;
  2)
      source "${workspace}/src/components/perform_summary_analysis.sh"
      source "${workspace}/src/components/menu.sh"
      break
      ;;
  3)
      source "${workspace}/src/components/perform_extended_analysis.sh"
      source "${workspace}/src/components/menu.sh"
      break
      ;;
  4)
      source "${workspace}/src/components/perform_single_analysis.sh"
      source "${workspace}/src/components/menu.sh"
      break
      ;;
  exit)
      exit
      ;;
  \?) # Invalid option
      echo "Error: Invalid option provided. Please provide a number or exit"
      break
      ;;
esac