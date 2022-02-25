#!/usr/bin/bash
#Name: hscheat.sh
#Purpose: Haskell hard so I make my own cheat sheets
#Note: Script not that loaded I would suggest using grep to get what you really want out of a cheatsheet

DIR="/home/sneed/Documents/Documentation/Haskell"

function usage() {
    echo -e "NAME:\n\thscheat - print out cheat sheets for haskell"
    echo -e "SYNOPSIS:\n\thscheat <sheet> - print out sheet contents\n\thscheat - print out avaliable sheets"
}

if [[ -z $1 ]]; then # if did not provide arg

    echo "Cheat Sheets:"
    for f in "${DIR}/*"; do
        echo $f | awk -F/ '{print $7}' # pull out file name from path cause no one cares where it is lmaooooo
    done

elif [[ -e "${DIR}/${1}" ]]; then # check if file exists

    cat "${DIR}/${1}"

else # if arg provided but file doesn't exist

    echo "Cheat sheet does not exist :("
    echo
    usage

fi
