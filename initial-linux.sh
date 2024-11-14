#!/bin/bash

#check if the Slack desktop app is intalled
if [ -x "$(command -v slack)" ]; then
	nohup slack >/dev/null 2>&1 &
else
	echo "Slack desktop app is not installed on this system"

fi

#Check if Google Chrome is installed and open it
if [ -x "$(command -v google-chrome-stable)" ]; then
	if pgrep -x "chrome" > /dev/null; then
		echo "Google is already running"
	else
	nohup google-chrome-stable &
	fi
else
	echo "Chrome is not installed on this system."

fi

# Check and open Vivaldi
if [ -x "$(command -v vivaldi)" ]; then
	if pgrep -x "vivaldi" > /dev/null; then
		echo "Vivaldi is already running"
	else
	nohup vivaldi &
	fi
else
	echo "Vivaldi is not installed on this system"
fi

#Check Mozila firefox
if [ -x "$(command -v firefox)" ]; then
	if pgrep -x "firefox" > /dev/null; then
		echo "Mozila Firefox is already running"
	else
	nohup firefox &
	fi
else
	echo "Mozila Firefox is not installed on this system"
fi
