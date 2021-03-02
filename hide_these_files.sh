#!/bin/bash

for f in *
do
	if [ $f != "hide_these_files.sh" ] && [ $f != "README.md" ]; then
		mv $f ~/.$f
	fi
done

mv ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py