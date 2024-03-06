#!/bin/bash
if [ -z $1 ]; then
	echo "Usage: git draft <branch> <topic>";
else
	if [ -z $2 ]; then
		git push origin HEAD:refs/drafts/$1;
	else
		git push origin HEAD:refs/drafts/$1/$2;
	fi;
fi;

