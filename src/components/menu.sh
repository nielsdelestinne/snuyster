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

COLUMNS=12
options_echo_prefix="  ║ ║ "
options_echo_prefix_last="  ╚═╝ "
listRepositoriesOption="${options_echo_prefix}➊ List repositories"
performSummaryAnalysisOption="${options_echo_prefix}➋ Perform summary analysis"
performFullAnalysisOption="${options_echo_prefix}➌ Perform extended analysis"
performSingleAnalysisOption="${options_echo_prefix}➍ Perform single analysis"
quitOption="${options_echo_prefix_last}✗ Quit"
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