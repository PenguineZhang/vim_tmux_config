#!/bin/bash

for f in *
do
	if [ $f != "hide_these_files.sh" ]; then
		mv $f .$f
	fi
done