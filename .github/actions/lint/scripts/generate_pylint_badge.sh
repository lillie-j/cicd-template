#!/bin/bash
source .venv/bin/activate

if [ -f "$GITHUB_WORKSPACE/pylint.log" ]; then
  echo '"$GITHUB_WORKSPACE/pylint.log" does not exist to parse score from.'
  exit 1
fi

SCORE=$(grep "Your code has been rated at" pylint.log | awk '{print $7}' | cut -d'/' -f1)
COLOR="red"
if (( $(echo "$SCORE >=9" | bc -l) )); then
    COLOR="green"
elif (( $(echo "$SCORE >=7" | bc -l ) )); then
    COLOR="yellow"
elif (( $(echo "$SCORE >=5" | bc -l) )); then
    COLOR="orange"  
elif (( $(echo "$SCORE <5" | bc -l) )); then
    COLOR="red"
fi

python -m pybadges \
--left-text="pylint" \
--right-text=$SCORE \
--right-color=$COLOR \
> pylint-badge.svg