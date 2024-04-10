#!/bin/bash

function perform_analysis() {

  analysis_to_run=$1
  IFS="${array_delimiter}" read -r -a repositories <<< "$2"
  analysis_title=$(echo "${analysis_to_run}" | sed 's/./& /g' | tr '[:lower:]' '[:upper:]')

  echo " ╔═╔═╝═╝ "
  echo " ║ ║ "
  echo " ║ ║  ▷▷  P E R F O R M   A N A L Y S I S   :   ${analysis_title}"
  echo " ║ ║ "
  echo " ╚═╚═╗═╗"

  echo "${echo_prefix}"

  for repository in "${repositories[@]}"; do
    echo "${echo_prefix}▷ Running ${analysis_to_run} analysis for ${repository}..."

    if [ $analysis_to_run == 'cloc' ]; then
      # Lines-of-code counting
      cd "${workspace}/${repositories_folder}/${repository}" || exit
      cloc . --vcs=git --by-file --csv --out="${workspace}/${reports_folder}/${repository}_${analysis_to_run}.csv" 2>&1 > /dev/null
      cd "${workspace}" || exit
    else
      if [ $analysis_to_run == 'revloc' ]; then
        output=$(python "${workspace}/src/functionality/generate_revision_per_loc.py" "${workspace}/${reports_folder}/${repository}_revisions.csv" "${workspace}/${reports_folder}/${repository}_cloc.csv")
        echo "$output" >"${workspace}/${reports_folder}/${repository}_revloc.csv"
      else
        code_maat -l "${workspace}/${git_logs_folder}/${repository}.log" -c git2 -o "${workspace}/${reports_folder}/${repository}_${analysis_to_run}.csv" -a "${analysis_to_run}"
      fi
    fi
    echo "${echo_prefix}    └── ✓ Success: analysis performed."
    echo "${echo_prefix}"
  done

  echo "${echo_prefix}✓ Done performing ${analysis_to_run} analysis."
  echo "${echo_prefix}"

}