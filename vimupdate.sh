#!/usr/bin/bash
#Name: vimupdate.sh
#Purpose: Update every git repository in parallel

for d in ~/.vim/pack/vendor/start/*; do
	cd $d
	(git pull 1>/dev/null && echo "Successfully updated $d!" || echo "Update Failed :(") &
done

wait
exit 0
