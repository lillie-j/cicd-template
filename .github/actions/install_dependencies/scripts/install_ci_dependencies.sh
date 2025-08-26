#!/bin/bash
source .venv/bin/activate
if [ -f "requirements-ci.txt" ]; then
  pip install -r requirements-ci.txt

else
  echo "requirements-ci.txt" not found
  exit 1

fi