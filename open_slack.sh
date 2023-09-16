#!/bin/bash

#check if the Slack desktop app is intalled
if [ -x "$(command -v slack)" ]; then
	nohup slack >/dev/null 2>&1 &
else
	echo "Slack desktop app is not installed on this system"

fi

#Check if Firefox is installed and open it
if [ -x "$(command -v firefox)" ]; then
	firefox &
else
	echo "Firefox is not installed on this system."

fi
