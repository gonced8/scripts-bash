#!/bin/bash

name="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
)"

if [ "$name" = "eduroam" -o "$name" = "polimi" ]
then
	networksetup -setdnsservers Wi-Fi "Empty"
	echo "DNS reset"
else
	networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4 2001:4860:4860::8888 2001:4860:4860::8844
	echo "DNS set"
fi

killall -HUP mDNSResponder
killall mDNSResponderHelper
dscacheutil -flushcache
