#!/bin/bash

force=$1

files=()
while IFS=  read -r -d $'\0'; do
	files+=("$REPLY")
done < <(find ~/OneDrive*/ -name "*-gonced8.*" -print0)

i=0
while [ $i -lt ${#files[@]} ]
do
	f=${files[$i]}

	if [ "$force" != "1" ]
	then
		echo -n "$f    Do you want to fix? (y/n): "
		read answer
	fi

	if [ "$answer" == "y" ] || [ "$force" == "1" ]
	then
		new_f="${f[@]//-gonced8/}"
		mv "$f" "$new_f"
		echo "$f    ->    $new_f"
	fi
	i=$(($i+1))
done
