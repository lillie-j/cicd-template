#!/bin/bash
# Usage: lint_with_pylint.sh <true/false> <comma separated folders to exclude (no leading . & .venv automatically excluded)>
# Example: lint_with_pylint.sh "true" "tests,src"

TRUE_OR_FALSE="$1"
FOLDERS="$2"

source .venv/bin/activate
if [[ "$TRUE_OR_FALSE" == "true" ]]; then
    pylint . --ignore="$FOLDERS,.venv" | tee pylint.log || true

elif [[ "$TRUE_OR_FALSE" == "false" ]]; then
    #Exit code of pipeline is last command, - tee should return 0. Need to fail pipeline if pylint does not return 0.
    pylint . --ignore="$FOLDERS,.venv" | tee pylint.log
    EXIT_CODE=${PIPESTATUS[0]}

    if [[ $EXIT_CODE -ne 0 ]]; then
    exit $EXIT_CODE
    fi

else
  echo "First positional argument must be 'true' or 'false'"
  exit 1
    
fi