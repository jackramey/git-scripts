#!/bin/bash

if [ "$1" == "help" ]; then
    echo "Usage: git review <branch> <topic>";
fi;

BRANCH=""
if [ -z $1 ]; then
    BRANCH="master"
else
    BRANCH=$1
fi;

if [ -f .reviewers ]; then
    REVIEWERS=$(tr '\n' ' ' < .reviewers | sed 's/ /,r=/g')
fi;
if [ -z "$REVIEWERS" ]; then
    if [ -z $2 ]; then
        git push origin HEAD:refs/for/$BRANCH;
    else
        git push origin HEAD:refs/for/$BRANCH/$2;
    fi;
else
    if [ -z $2 ]; then
        git push origin HEAD:refs/for/$BRANCH%r=$REVIEWERS;
    else
        git push origin HEAD:refs/for/$BRANCH/$2%r=$REVIEWERS;
    fi;
fi;

