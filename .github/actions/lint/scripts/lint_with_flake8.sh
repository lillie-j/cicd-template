#!/bin/bash
# Usage: lint_with_flake8.sh <true/false> <folders_to_exclude (no leading . & .venv automatically excluded)>
# Example: lint_with_flake8.sh "true" "tests"

TRUE_OR_FALSE="$1"
FOLDERS="$2"

source .venv/bin/activate
if [[ "$TRUE_OR_FALSE" == "true" ]]; then
    flake8 . --exclude="$FOLDERS,.venv" --exit-zero

else
    flake8 . --exclude="$FOLDERS,.venv"

fi