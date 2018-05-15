#!/bin/bash

function process_guess(){
    local continue=false
    if [ $1 -gt $2 ]; then
        echo "too high"
    elif [ $1 -lt $2 ]; then
        echo "too low"
    else
        echo "Perfect"
        continue=false
    fi
}

total_files=$(ls|wc -l)
echo $total_files
echo "Welcome to the guessing game"
echo "Guess how many files are there"
read guessed_file_number

while true; do
    continue=`process_guess "$guessed_file_number" "$total_files"`
    echo "Your guess is $continue"
	if [ "$continue" == "Perfect" ]; then
		echo "Congratulations you guessed correctly"
        break
	else
		echo "Sorry try again"
        read guessed_file_number
	fi
done
