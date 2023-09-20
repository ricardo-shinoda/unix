#!/bin/bash

if pgrep -x "Slack" /dev/null; then
	slack_pid=$(pgrep -x "Slack")

	kill $slack_pid
	echo "Slack has been closed"

else
	echo "Slack is not currently working"

fi
