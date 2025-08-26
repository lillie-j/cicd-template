#!/bin/bash
python -m venv .venv
source .venv/bin/activate

# Parse dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
  echo "Installing dependencies from requirements.txt"  
  pip install -r requirements.txt

else
  echo "Error: No dependency file found - expected requirements.txt"
  exit 1
fi