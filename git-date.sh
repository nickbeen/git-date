#!/usr/bin/env sh
#
# Shell script for changing the date of the last local commit.
#
# Copyright (C) 2022 Nick Been (https://github.com/nickbeen/git-date)
# Permission to use, copy, modify and redistribute is granted under the MIT License (MIT).
#
# Usage: ./git-date.sh <commitDate>
#
# Operands:
#   <commitDate>    Date in git internal format, RFC 2822 format, ISO 8601 format or human-centric date format.

commitDate="$1"

if [ -z "$commitDate" ]
then
    echo "Error: operand commitDate is required"
    exit 1
fi

export GIT_AUTHOR_DATE=${commitDate}
export GIT_COMMITTER_DATE=${commitDate}

if ! git commit --amend --no-edit --date "${commitDate}" > /dev/null 2>&1;
then
    echo "Error: cannot amend the last local commit."
    exit 1
else
    git log --stat -1
fi
