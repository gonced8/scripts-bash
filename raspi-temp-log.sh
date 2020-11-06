#!/bin/bash

FOLDER="/home/pi/temp-log"

# Get time and temperature
TIME=$(/bin/date '+%R')
TEMP=$(vcgencmd measure_temp | sed -r "s/.*=([0-9]{1,3}\.[0-9])'.*/\1/g")

# Log temperature
printf "${TIME}\t${TEMP}\n" >> "${FOLDER}/$(/bin/date '+%Y-%m-%d').log"

# Remove logs older than 7 days
ls -t ${FOLDER}/* | sed -e '1,7d' | xargs -d '\n' rm
