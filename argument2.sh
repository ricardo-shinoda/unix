#!/bin/bash

name=$1
user=$(whoami)
where=$(pwd)
today=$(date)


echo "Good day $name!!!"
sleep 2
echo "Your are logged as user: $user on: $where"
sleep 2
echo "And today is: $today"
