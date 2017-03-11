#!/bin/bash

#http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )
while [[ $# -gt 1 ]]
do
	key="$1"

	case $key in
		-e|--extension)
			EXTENSION="$2"
			shift # past argument
			;;
		-s|--searchpath)
			SEARCHPATH="$2"
			shift # past argument
			;;
		*)
			# unknown option
			;;
	esac
	shift # past argument or value
done


#http://askubuntu.com/questions/377438/how-can-i-recursively-delete-all-files-of-a-specific-extension-in-the-current-di
find . -name "*.${EXTENSION}" -type f 

#http://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script
while true; do
	read -p "Do you wish to remove above files? [y/n]" yn
	case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done

#echo "Do you wish to install this program?"
#select yn in "Yes" "No"; do
#case $yn in
#Yes ) make install; break;;
#No ) exit;;
#esac
#done

#http://askubuntu.com/questions/377438/how-can-i-recursively-delete-all-files-of-a-specific-extension-in-the-current-di
find . -name "*.${EXTENSION}" -type f -delete
