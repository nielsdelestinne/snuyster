#!/bin/bash
clear
echo "╔══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░   ▷  S I N G L E   A N A L Y S I S                    ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░                                                       ░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║"
echo "╚════╗ ╔═══════════════════════════════════════════════════════════════════════════════════╝"

function invalid_analysis_mode() {
  echo "${echo_prefix}"
  echo "${echo_prefix}✗ Error: No correct analysis mode was provided, please provide one of the following values:"
  echo "${echo_prefix}    └── For line-of-code counting: cloc."
  echo "${echo_prefix}    └── For revision per line-of-code counting: revloc (expects analyses 'cloc' & 'revisions' have been run)."
  echo "${echo_prefix}    └── For code-maat analysis:"
  echo "${echo_prefix}         └── abs-churn, age, author-churn, authors, communication, coupling, entity-churn, entity-effort, entity-ownership,"
  echo "${echo_prefix}         └── fragmentation, identity, main-dev, main-dev-by-revs, refactoring-main-dev, revisions, soc, summary"
  echo "${echo_prefix}"
}

# Get cloned repository names
source "${workspace}/src/shared/get_cloned_repository_names.sh"
readarray -t repository_names < <(get_cloned_repository_names)

echo "${echo_prefix}"
echo "${echo_prefix}Provide one of the available analysis modes: "
echo "${echo_prefix}    └── For line-of-code counting: cloc"
echo "${echo_prefix}    └── For revision per line-of-code counting: revloc (expects cloc & revisions analyses to have been run)"
echo "${echo_prefix}    └── For code-maat analysis:"
echo "${echo_prefix}            └── abs-churn, age, author-churn, authors, communication, coupling, entity-churn, entity-effort, entity-ownership,"
echo "${echo_prefix}            └── fragmentation, identity, main-dev, main-dev-by-revs, refactoring-main-dev, revisions, soc, summary"

echo "${echo_prefix}Selected mode: "
read -rp "${echo_prefix}    └── " analysis_to_run

if [[ -z "$analysis_to_run" ]]; then
    invalid_analysis_mode
else
  supported_analyses=("cloc" "revloc" "abs-churn" "age" "author-churn" "authors" "communication" "coupling" "entity-churn" "entity-effort" "entity-ownership" "fragmentation" "identity" "main-dev" "main-dev-by-revs" "refactoring-main-dev" "revisions" "soc" "summary")
  # shellcheck disable=SC2199
  if [[ ${supported_analyses[@]} =~ ${analysis_to_run} ]]; then
    # Perform analysis
    IFS="${array_delimiter}"
    source "${workspace}/src/analysis/perform_analysis.sh"
    perform_analysis "${analysis_to_run}" "${repository_names[*]}"
    unset IFS


    # Aggregate results
    for repository in "${repository_names[@]}"; do
      python "${workspace}/src/analysis/aggregate_analysis_single_repository.py" "${workspace}" "${analysis_to_run}" "${repository}"
    done
    python "${workspace}/src/analysis/aggregate_analysis_multiple_repositories.py" "${workspace}" "${analysis_to_run}"
  else
    invalid_analysis_mode
  fi
fi

# Footer
source "${workspace}/src/main-menu/menu_task_footer.sh"