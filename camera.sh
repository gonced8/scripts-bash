#!/bin/bash

search_dir="/Volumes/EOS_DIGITAL/DCIM/100CANON"
copy_dir="/Users/gonced8/Pictures"

# Gets an array with all the files to be copied
files=("$search_dir"/*.[jJ][pP][gG])
# Counts the number of files
n_files=${#files[@]}
# Initializes the current date of the copies' folder
date_dir=""
# Initializes counter
count=0

for file in "${files[@]}"
do
	if [ -e "$file" ]
	then
		# Get date of the file
		date="$(date -r "$file" "+%Y_%m_%d")"

		# Create date folder if it doesn't already exist
		if [ "$date" != "$date_dir" ]
		then
			date_dir="$date"
			mkdir -p "${copy_dir}/${date_dir}"
		fi

		# Gets the filename from the file path
		filename=$(basename "$file")

		count=$((count+1))
		echo -e "$((count*100/n_files))%\t${date}/${filename}"

		# Copy file if it isn't already copied
		cp -n "$file" "${copy_dir}/${date_dir}/${filename}"
	fi
done
