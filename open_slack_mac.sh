#!/bin/bash

if [ -d "/Applications/Slack.app" ]; then
	open -a "Slack"&
else
	echo "Slack is not installed on this system"

fi

