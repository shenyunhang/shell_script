#!/bin/bash

# this script is modification of best answer of following question: 
# http://unix.stackexchange.com/questions/23130/how-to-report-number-of-files-in-all-subdirectories


QUICK=false
while getopts ":q" opt; do
	case $opt in
		q)
			echo "Using quick mode!" >&2
			QUICK=true
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit
			;;
	esac
done



for f in *
do
	if [ -d ./"$f" ]
	then
		echo -n $f ": "
		if ${QUICK}
		then
			ls -l ./"$f"  | wc -l 
		else
			find ./"$f" -maxdepth 1 -exec echo \; | wc -l 
		fi
	fi
done
