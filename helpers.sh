#!/bin/bash

function get_pwd () {

 	# find directory of this script
	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
		SOURCE="$(readlink "$SOURCE")"
     	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to      resolve it relative to the path where the symlink file was located
 	done
	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
	echo "$DIR"
}

function graceful_ln () {
	if [ -L "$2" ]
	then
		# the existing file is a symlink, remove
		echo "deleted old symlink from $2 -> $1"
		rm $2
	else	
		if [ -e "$2" ]
		then
			# there is file (which is not a symlink) 
			# existing at $2, move to $2.bak
			echo "file exists for $2, moving to $2.bak "
			mv $2 $2.bak
		fi
	fi
	
	# Create new symlink
	ln -s $1 $2
	echo "created symlink from $2 -> $1"
}
