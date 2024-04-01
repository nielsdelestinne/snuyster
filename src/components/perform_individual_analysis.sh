#!/bin/bash
clear
echo "╔══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░ 🔵 F U L L   A N A L Y S I S ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║"
echo "╚═════╤════════════════════════════════════════════════════════════════════════════════════╝"

# Get clones repository names
source "${workspace}/src/functionality/get_cloned_repository_names.sh"
readarray -t repository_names < <(get_cloned_repository_names)

echo "${echo_prefix}"
echo "${echo_prefix}Provide one of the available analysis modes: "
echo "${echo_prefix}    └── For line-of-code counting: cloc"
echo "${echo_prefix}    └── For revision per line-of-code counting: revloc (expects cloc & revisions analyses to have been run)"
echo "${echo_prefix}    └── For code-maat analysis:"
echo "${echo_prefix}            └── abs-churn, age, author-churn, authors, communication, coupling, entity-churn, entity-effort, entity-ownership,"
echo "${echo_prefix}            └── fragmentation, identity, main-dev, main-dev-by-revs, messages, refactoring-main-dev, revisions, soc, summary"

echo "${echo_prefix}Selected mode: "
read -rp "${echo_prefix}    └── " analysis_to_run

if [[ -z "$analysis_to_run" ]]; then
    analysis_to_run="age"
    echo "${echo_prefix}    └── No value provided, using default value: ${analysis_to_run}"
fi

# Perform analysis
IFS="${array_delimiter}"
source "${workspace}/src/functionality/perform_analysis.sh"
perform_analysis "${analysis_to_run}" "${repository_names[*]}"
unset IFS


# Aggregate results
for repository in "${repository_names[@]}"; do
  python "${workspace}/src/functionality/aggregate_analysis_single_repository.py" "${analysis_to_run}" "${repository}"
done
python "${workspace}/src/functionality/aggregate_analysis_multiple_repositories.py" "${analysis_to_run}"

# Footer
source "${workspace}/src/components/menu_task_footer.sh"