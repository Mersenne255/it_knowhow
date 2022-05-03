#!/bin/bash

read -p 'Commit or amend ['c'/'a']: ' TYPE 

if [[ ! "$TYPE" =~ [ca] ]]
	then 
    echo 'Type must be either "c" or "a"' 
    exit 0 
fi 
if [[ "$TYPE" == 'c' ]]
	then
	read -p 'Commit message: ' MESSAGE 
fi

read -p 'Timestamp: ' TIMESTAMP 

if [ -z "$TIMESTAMP" ] 
then 
    echo 'Timestamp cannot be empty' 
    exit 0 
fi 

GIT_COMMITTER_DATE=`LC_ALL=en.utf8 date --date="$TIMESTAMP"` 
AUTHOR_DATE=$GIT_COMMITTER_DATE
export GIT_COMMITTER_DATE
if [[ "$TYPE" == 'a' ]]
	then
	git commit --amend --no-edit --date="$AUTHOR_DATE"
	exit 0
fi
if [[ "$TYPE" == 'c' ]]
	then
	git add .
	git commit -m "$MESSAGE" --date="$AUTHOR_DATE"
	exit 0
fi