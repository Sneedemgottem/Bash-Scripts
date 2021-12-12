#!/bin/bash
#Title: mkproject.sh
#Purpose: initialize projects according to selected langauge

lang=$1
project_name=$2

# Handle error if no arguments are supplied
function usage()
{
	echo -e "Usage:\t$0 <language> <project_name>" 1>&2
	echo 1>&2
	exit $1
}

if [[ $# -lt 2 ]]; then
	echo "Not enough arguments provided!"
	usage 1
fi

# Load in language set up files
if [[ -d ./langs.conf.d ]]; then
	for rc in ./langs.conf.d/*; do
		if [[ -f "$rc" ]]; then
			. "$rc"
		fi
	done
fi
