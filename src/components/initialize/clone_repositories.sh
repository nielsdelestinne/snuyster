#!/bin/bash
echo " ╔═╔═╝═╝ "
echo " ║ ║ "
echo " ║ ║  ▷▷  C L O N E   R E P O S I T O R I E S"
echo " ║ ║ "
echo " ╚═╚═╗═╗"
if [ -s "${repositories_to_clone_filename}" ]; then
  echo "${echo_prefix}"
  echo "${echo_prefix}File ${repositories_to_clone_filename} found."
  echo "${echo_prefix}    └── ▷ starting to clone repositories..."
  echo "${echo_prefix}"
  while IFS= read -r repository; do
    echo "${echo_prefix}▷ Cloning ${repository}"
    cd ${repositories_folder} || exit
     if ! error=$(git clone "${repository}" 2>&1 > /dev/null); then
      if [[ "${error}" == *"already exists"* ]]; then
        echo "${echo_prefix}    └── ➝ Skipped: already exists."
      else
        echo "${echo_prefix}    └── ✗ Error: ${error:0:50}... [...]"
        log "${error}"
      fi
    else
      echo "${echo_prefix}    └── ✓ Success: repository cloned."
    fi
    cd ..
    echo "${echo_prefix}"
  done < "${repositories_to_clone_filename}"
else
  echo "${echo_prefix}No '${repositories_to_clone_filename}' file was found."
  echo "${echo_prefix}    └── Snuyster will not clone any repositories."
  echo "${echo_prefix}    └── Snuyster expects all repositories to be present in '${repositories_to_clone_filename}'."
fi

if [[ "${error}" != *"Cloning into"* ]]; then
  if [[ "${error}" == *"already exists"* ]]; then
    echo "${echo_prefix}✓ Done cloning repositories (but some were skipped)"
    echo "${echo_prefix}"
  else
    echo "${echo_prefix}✗ Cloning repositories finished with errors."
    echo "${echo_prefix}    └── Please inspect the output above or the logs (${error_log_file}) for details."
    echo "${echo_prefix}"
  fi
else
  echo "${echo_prefix}✓ Done cloning repositories."
  echo "${echo_prefix}"
fi
read -rp "${echo_prefix}Press enter to continue..."