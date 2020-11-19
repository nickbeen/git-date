#!/bin/sh

date="$1"

if [ -z "$date" ]
then
    echo "Error: date is missing"
    exit 1
fi

export GIT_AUTHOR_DATE=${date}
export GIT_COMMITTER_DATE=${date}

if ! git commit --amend --no-edit --date "$date}" > /dev/null 2>&1;
then
    echo "ERROR: can't make commit"
    exit 1
else
    git log -1
fi
