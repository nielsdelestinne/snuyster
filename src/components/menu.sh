#!/bin/bash
echo "╔══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║ ╔══════════════════════════════════════════════════════════════════════════════════════╗ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░ ◫  M E N U ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ║ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ║ ║"
echo "║ ╚══════════════════════════════════════════════════════════════════════════════════════╝ ║"
echo "╚═════╤════════════════════════════════════════════════════════════════════════════════════╝"

COLUMNS=12
options_echo_prefix="   │ "
listRepositoriesOption="${options_echo_prefix}🟠 List repositories"
performSummaryAnalysisOption="${options_echo_prefix}🟢 Perform summary analysis"
performFullAnalysisOption="${options_echo_prefix}🔵 Perform extended analysis"
performSingleAnalysisOption="${options_echo_prefix}🟣 Perform single analysis"
quitOption="${options_echo_prefix}❌  Quit"
options=("${listRepositoriesOption}" "${performSummaryAnalysisOption}" "${performFullAnalysisOption}" "${performSingleAnalysisOption}" "${quitOption}")

echo "${echo_prefix}"
echo "${echo_prefix}Make your selection:"
echo "${echo_prefix}"

select opt in "${options[@]}"
do
    case $opt in
        "${listRepositoriesOption}")
            source "${workspace}/src/components/list_repositories.sh"
            source "${workspace}/src/components/menu.sh"
            break
            ;;
        "${performSummaryAnalysisOption}")
            source "${workspace}/src/components/perform_summary_analysis.sh"
            source "${workspace}/src/components/menu.sh"
            break
            ;;
        "${performFullAnalysisOption}")
            source "${workspace}/src/components/perform_extended_analysis.sh"
            source "${workspace}/src/components/menu.sh"
            break
            ;;
        "${performSingleAnalysisOption}")
            source "${workspace}/src/components/perform_single_analysis.sh"
            source "${workspace}/src/components/menu.sh"
            break
            ;;
        "${quitOption}")
            exit
            ;;
        *) echo "invalid option $REPLY. Please provide a valid option number.";;
    esac
done