#!/bin/bash

function perform_analysis() {

  analysis_to_run=$1
  IFS="${array_delimiter}" read -r -a repositories <<< "$2"
  analysis_title=$(echo "${analysis_to_run}" | sed 's/./& /g' | tr '[:lower:]' '[:upper:]')

  echo "  ┌───┘"
  echo "  │ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
  echo "  │ ░░ ▽  P E R F O R M   A N A L Y S I S   :   ${analysis_title}"
  echo "  │ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
  echo "  └───┬─────────────────────────────────────────────────────────────────────────────────"


  echo "${echo_prefix}"

  if [ -n "$analysis_to_run" ]; then
    for repository in "${repositories[@]}"; do
      if [ ! -f "${workspace}/${reports_folder}/${analysis_to_run}_${repository}.csv" ]; then
        echo "${echo_prefix}▽ Running ${analysis_to_run} analysis for ${repository}"

        if [ $analysis_to_run == 'cloc' ]; then
          # Lines-of-code counting
          cd "${workspace}/${repositories_folder}/${repository}" || exit
          cloc . --vcs=git --by-file --csv --out="${workspace}/${reports_folder}/${repository}_${analysis_to_run}.csv" > /dev/null 2>>"${workspace}/${error_log_file}" # TODO use error method with timestamp
          cd "${workspace}" || exit
        else
          if [ $analysis_to_run == 'revloc' ]; then
            output=$(python "${workspace}/src/functionality/generate_revision_per_loc.py" "${workspace}/${reports_folder}/${repository}_revisions.csv" "${workspace}/${reports_folder}/${repository}_cloc.csv")
            echo "$output" >"${workspace}/${reports_folder}/${repository}_revloc.csv"
          else
            code_maat -l "${workspace}/${git_logs_folder}/${repository}.log" -c git2 -o "${workspace}/${reports_folder}/${repository}_${analysis_to_run}.csv" -a "${analysis_to_run}"
          fi
        fi
        echo "${echo_prefix}    └── ✅  Success: analysis performed."
      else
        echo "${echo_prefix}▽ Skipping ${analysis_to_run} analysis of ${repository}."
        echo "${echo_prefix}    └── ℹ️ File ${repository}_${analysis_to_run}.csv already exists"
      fi
      echo "${echo_prefix}"
    done
  else
    echo "${echo_prefix}    └── ❌  Error: No analysis mode was provided, please provide one of the following values:"
    echo "${echo_prefix}             └── For line-of-code counting: cloc."
    echo "${echo_prefix}             └── For revision per line-of-code counting: revloc (expects analyses 'cloc' & 'revisions' have been run)."
    echo "${echo_prefix}             └── For code-maat analysis:"
    echo "${echo_prefix}                  └── abs-churn, age, author-churn, authors, communication, coupling, entity-churn, entity-effort, entity-ownership,"
    echo "${echo_prefix}                  └── fragmentation, identity, main-dev, main-dev-by-revs, messages, refactoring-main-dev, revisions, soc, summary"
  fi

  echo "${echo_prefix}✅  Done performing ${analysis_to_run} analysis."
  echo "${echo_prefix}"

}