#!/bin/bash

echo "======================="
echo ""
echo "== 1. Generating logs"
echo ""
echo "======================="
echo ""

source variables.sh

after_date="2015-01-01"

for name in "${services[@]}"; do
    # Check if directory exists
    if [ -d "../$name" ]; then
        # Change directory and execute git log command
        cd "../$name" && \
        if [ ! -f "../code-inspection/datafiles/${name}.log" ]; then
          echo "Generating logs for ${name}"
          git log --all --numstat --date=short --pretty=format:'--%h--%ad--%aN' --no-renames --after="${after_date}" > "../code-inspection/datafiles/${name}.log"
          cd - > /dev/null || exit
          echo "   --> [done]"
        else
          echo "Skipping generating file ${name}.log as it already exists"
        fi
    else
        echo "Directory $name does not exist."
    fi
done

echo ""
echo "======================="
echo ""