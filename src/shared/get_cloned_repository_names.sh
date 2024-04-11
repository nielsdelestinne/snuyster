#!/bin/bash

# Returns the name of the cloned repositories as an array
function get_cloned_repository_names() {
  cloned_repositories=()
  while IFS= read -r -d $'\0' repository; do
      cloned_repositories+=("$repository")
  done < <(find "${workspace}/${repositories_folder}" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

  for repository_path in "${cloned_repositories[@]}"; do
      repository_name="${repository_path##*/}"  # extracts repo-name.git from my/path/to/repositories/repo-name.git
      repository_name="${repository_name%.git}" # extract repo-name from repo-name.git if .git suffix exists
      echo "${repository_name}"
  done
}