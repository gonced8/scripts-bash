#!/bin/bash

DATE=$(date +"%Y_%m_%d")

if [ ! -f "${DATE}.txt" ] || [ ! -s "${DATE}.txt" ]
then
	exec nvim -c "%norm i${DATE}" "${DATE}.txt"
else
	exec nvim "${DATE}.txt"
fi

