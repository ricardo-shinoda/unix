#!/bin/bash

if [ -x "$(command -v slack)" ]; then
	nohup slack >/dev/null 2>&1 &
else
	echo "Slack is not installed on this system"

fi

