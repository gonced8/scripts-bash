#!/bin/bash
# Script to check which of your contacts were leaked (Facebook)

if [ "$#" -lt 2 ]
then
	echo "$0 <path/to/contacts/file> <path/to/leaked/file>"
	exit
fi

# Country code
code="351"

# Function to join array with delimiter
function join_by { local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi; }

# Get phone numbers from $1 and remove spaces
numbers=$(grep -Eo "($code)?\s?[29][0-9]{2}(\s?[0-9]{3}){2}" $1 | sed 's/\s*//g')

# Count total number of contacts
n_total=$(echo "${numbers[@]}" | wc -l)

# Join array using | as delimiter
numbers=$(join_by '|' ${numbers})

# Regex expression to search numbers in the beginning of each line
numbers="^($code)?($numbers)"

# Grep from leaked file
leaked=$(grep -E $numbers $2)

# Get contact names sorted and number of leaked
names=$(echo "${leaked[@]}" | sed -n "s/^[^:]*:[^:]*:\([^:]*\):\([^:]*\):.*$/\1 \2/p" | sort)

# Count contacts leaked
n_leaked=$(echo "${names[@]}" | wc -l)

# Print
echo "$names"
echo "# leaked: $n_leaked/$n_total"
