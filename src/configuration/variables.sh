#!/bin/bash

workspace=$(pwd)

supported_java_major_version="21"
supported_python_major_version="3"
supported_cloc_major_version="2"

reports_folder="reports"
repositories_folder="repositories"
repositories_to_clone_filename="${repositories_folder}/to-clone.txt"
git_logs_folder="git-logs"

logs_folder="logs"
log_file="${logs_folder}/snuyster.log"

echo_prefix="     ║ ║ "

array_delimiter=";"