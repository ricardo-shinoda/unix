#!/bin/bash

echo "What is your name?"

read name

echo "Hey $name!"
sleep 2
echo "You're looking good today $name"
sleep 3
echo "I hope you, $name, have a wonderfull day"
MY_VARIABLE="Hello World"

echo $MY_VARIABLE
CURRENT_DATE=$(date)
sleep 1
echo "Right now is: " $CURRENT_DATE
