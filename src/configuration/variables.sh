#!/bin/bash

workspace=$(pwd)

reports_folder="reports"
repositories_folder="repositories"
repositories_to_clone_filename="${repositories_folder}/to-clone.txt"
git_logs_folder="git-logs"

logs_folder="logs"
error_log_file="${logs_folder}/error.log"
info_log_file="${logs_folder}/info.log"

echo_prefix="      │ "

array_delimiter=";"