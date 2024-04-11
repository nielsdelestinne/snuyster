#!/bin/bash
clear
echo "╔══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░   ▷  S U M M A R Y   A N A L Y S I S                  ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║"
echo "╚════╗ ╔═══════════════════════════════════════════════════════════════════════════════════╝"

# Get cloned repository names
source "${workspace}/src/shared/get_cloned_repository_names.sh"
readarray -t repository_names < <(get_cloned_repository_names)

# Perform analysis
IFS="${array_delimiter}"
source "${workspace}/src/analysis/perform_analysis.sh"
perform_analysis summary "${repository_names[*]}"
unset IFS

# Aggregate results
python "${workspace}/src/analysis/aggregate_summary_analysis.py" "${workspace}"

# Footer
source "${workspace}/src/main-menu/menu_task_footer.sh"