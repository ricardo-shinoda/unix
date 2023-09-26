#!/bin/bash

if [ -d "/Applications/Slack.app" ]; then
	open -a "Slack"&
else
	echo "Slack is not installed on this system"

fi

if [ -d "/Applications/Asana.app" ]; then
	open -a "Asana"&
else
	echo "Asana is not installed on this system"
fi

if [ -d "/Applications/Nuclino.app" ]; then
	open -a "Nuclino"&
else
	echo "Nuclino is not installed on this system"
fi

if [ -d "/Applications/1Password.app" ]; then
	open -a "1Password"&
else
	echo "1Password is not installed on this system"
fi

