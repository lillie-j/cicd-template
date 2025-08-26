#!/bin/bash
export PIPENV_VENV_IN_PROJECT=1

# Parse dependencies from Pipfile.lock
if [ -f "Pipfile.lock" ]; then
  echo "Installing dependencies from Pipfile.lock"
pipenv install --ignore-pipfile
  
# Parse dependencies from Pipfile
elif [ -f "Pipfile" ]; then
  cat <<EOF
No Pipfile.lock file detected. Installing dependencies from Pipfile.
Recommend creating a Pipfile.lock. Cache is tied to Pipfile.lock.
EOF 
  pipenv install

# Parse dependencies from requirements.txt
elif [ -f "requirements.txt" ]; then
  cat <<EOF
No Pipfile.lock or Pipfile detected. Installing dependencies from requirements.txt.
Recommend creating a Pipfile.lock to lock exact versions of dependencies.
Cache is tied to Pipfile.lock. 
EOF
  pipenv run pip install -r requirements.txt

else
  echo "Error: No dependency file found - expect one of Pipfile.lock, Pipfile, requirements.txt"
  exit 1
fi