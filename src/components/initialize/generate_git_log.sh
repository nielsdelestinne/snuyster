#!/bin/bash
echo "  ┌───┘"
echo "  │ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "  │ ░░ ▽  G E N E R A T E   G I T   L O G ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "  │ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "  └───┬─────────────────────────────────────────────────────────────────────────────────"

echo "${echo_prefix}"
echo "${echo_prefix}Provide the start date of the history: "
read -rp "${echo_prefix}    └── ("yyyy-MM-dd"): " after_date

if [[ -z "$after_date" ]]; then
    after_date="2010-01-01"
    echo "${echo_prefix}    └── No value provided, using default value: ${after_date}"
fi

mkdir -p git-logs

cloned_repositories=()
while IFS= read -r -d $'\0' repository; do
    cloned_repositories+=("$repository")
done < <(find "${workspace}/${repositories_folder}" -mindepth 1 -maxdepth 1 -type d -print0)

for repository_path in "${cloned_repositories[@]}"; do
    repository_name="${repository_path##*/}"  # extracts repo-name.git from my/path/to/repositories/repo-name.git
    repository_name="${repository_name%.git}" # extract repo-name from repo-name.git if .git suffix exists

    # Change directory and execute git log command
    cd "${workspace}/${repositories_folder}/${repository_name}" && \
    echo "${echo_prefix}"
    echo "${echo_prefix}▽ Generating Git log file for ${repository_name}"
    if [ -f "${workspace}/${git_logs_folder}/${repository_name}.log" ]; then
      rm "${workspace}/${git_logs_folder}/${repository_name}.log"
      echo "${echo_prefix}    └── ⚠️  A Git log file for ${repository_name} already existed and was removed."
    fi
    git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames --after="${after_date}" > "${workspace}/${git_logs_folder}/${repository_name}.log"
    cd - > /dev/null || exit
    echo "${echo_prefix}    └── ✅  Success: Git log file is created."
done
echo "${echo_prefix}"
echo "${echo_prefix}✅  Done generating Git log files."
echo "${echo_prefix}"
read -rp "${echo_prefix}Press enter to continue..."
