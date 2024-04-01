#!/bin/bash

error=$1

current_timestamp=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$current_timestamp] $error" >"${workspace}/${error_log_file}"