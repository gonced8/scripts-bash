#!/bin/bash

if [ -z "$1" ]; then
	echo "No file supplied"
else
	name="${1%%.*}"
	gcc -o "$name" "$@" && ./"$name"
fi
