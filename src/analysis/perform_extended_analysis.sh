#!/bin/bash
clear
echo "╔══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░   ▷  F U L L   A N A L Y S I S                        ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║"
echo "╚════╗ ╔═══════════════════════════════════════════════════════════════════════════════════╝"
# Get clones repository names
source "${workspace}/src/shared/get_cloned_repository_names.sh"
readarray -t repository_names < <(get_cloned_repository_names)

# Perform multiple analyses
analyses_to_run=('age' 'soc' 'entity-churn' 'cloc' 'revisions' 'revloc')
for analysis_to_run in "${analyses_to_run[@]}"; do
  IFS="${array_delimiter}"
  source "${workspace}/src/analysis/perform_analysis.sh"
  perform_analysis "${analysis_to_run}" "${repository_names[*]}"
  unset IFS
done

# Aggregate results
for repository in "${repository_names[@]}"; do
  python "${workspace}/src/analysis/aggregate_extended_analysis_single_repository.py" "${workspace}" "${repository}"
done
python "${workspace}/src/analysis/aggregate_extended_analysis_multiple_repositories.py" "${workspace}"

# Footer
source "${workspace}/src/main-menu/menu_task_footer.sh"