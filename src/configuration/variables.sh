#!/bin/bash

workspace=$(pwd)

supported_java_major_version="21"
supported_python_major_version="3"
supported_cloc_major_version="1"  # although cloc v2 is released, apt-get host only up to v1.9

results_folder="/results"
reports_folder="${results_folder}/reports"
reports_aggregated_folder="${reports_folder}/aggregated"
repositories_folder="repositories"
repositories_to_clone_filename="${repositories_folder}/to-clone.txt"
git_logs_folder="${results_folder}/git-logs"
logs_folder="${results_folder}/logs"
log_file="${logs_folder}/snuyster.log"

echo_prefix="     ║ ║ "

array_delimiter=";"