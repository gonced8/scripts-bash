#!/bin/bash

# Script to send an e-mail everytime Public IP changes.

# e-mail to send to
ADDRESS="example_address@gmail.com"

# link to get the public address from
URL='https://ipecho.net/plain'
SLEEP_HTTP_ERROR=60	# sleep for 60 s = 1 min
SLEEP_CHECK_IP=1800	# sleep for 1800 s = 30 min

# where to store the previous IP
previous_ip_path="/tmp/previous_ip"
touch $previous_ip_path
previous_ip=$(cat $previous_ip_path)

while true
do
	while true
	do
		http_response=$(curl --silent --write-out "%{http_code}" $URL)
		http_status=${http_response:(-3)}

		if [ $http_status -eq 200 ]
		then
			break
		else
			sleep $SLEEP_HTTP_ERROR
		fi
	done

	current_ip="${http_response::-3}"

	if [ "$current_ip" != "$previous_ip" ]
	then
		previous_ip="$current_ip"
		echo "$previous_ip" > $previous_ip_path

		current_date=$(date)

		message=$(printf '%s\n\n%s' "${current_date}" "${current_ip}")
		printf "${message}" | mail -s "[bot] Public IP" "$ADDRESS"
	fi

	sleep $SLEEP_CHECK_IP
done
