#!/bin/bash

function log() {
  statement=$1
  current_timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$current_timestamp] $statement" >"${workspace}/${log_file}"
}

