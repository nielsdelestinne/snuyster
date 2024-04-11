#!/bin/bash
echo " ╔═╔═╝═╝ "
echo " ║ ║ "
echo " ║ ║  ▷▷  C H E C K   V E R S I O N S"
echo " ║ ║ "
echo " ╚═╚═╗═╗"

echo "${echo_prefix}"
echo "${echo_prefix}Checking versions of required tools:"

java_major_version=$(java --version | grep -o -m 1 '[0-9]*\.[0-9]*\.[0-9]*' | awk '{print $1}' | cut -d. -f1)
if [ "${java_major_version}" == "${supported_java_major_version}" ]; then
  echo "${echo_prefix}    └── ✓ Your JDK is on major version ${supported_java_major_version}."
else
  echo "${echo_prefix}    └── ✗ Your JDK is on major version ${java_major_version}, please upgrade to version ${supported_java_major_version} to avoid any weird behavior."
fi

python_major_version=$(python --version | grep -o -m 1 '[0-9]*\.[0-9]*\.[0-9]*' | awk '{print $1}' | cut -d. -f1)
if [ "${python_major_version}" == "${supported_python_major_version}" ]; then
  echo "${echo_prefix}    └── ✓ Your Python is on major version ${supported_python_major_version}."
else
  echo "${echo_prefix}    └── ✗ Your Python is on major version ${python_major_version}, please upgrade to version ${supported_python_major_version} to avoid any weird behavior."
fi

cloc_major_version=$(cloc --version | grep -o -m 1 '^[0-9]*')
if [ "${cloc_major_version}" == "${supported_cloc_major_version}" ]; then
  echo "${echo_prefix}    └── ✓ Your Cloc is on major version ${supported_cloc_major_version}."
else
  echo "${echo_prefix}    └── ✗ Your Cloc is on major version ${cloc_major_version}, please use version ${supported_cloc_major_version} to avoid any weird behavior."
fi

echo "${echo_prefix}"
read -rp "${echo_prefix}Press enter to continue..."