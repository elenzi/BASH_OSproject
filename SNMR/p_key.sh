#! /bin/bash

if [ -z "$1" ]; then
    echo "Usage $0 mutex-name"
    exit 1
else
    while ! ln mutex "$1-lock" 2>/dev/null; do
        sleep 1
    done
    exit 0
fi

## ALTERNATIVE VERSION
#if [ -z "$1" ]; then
#    echo "Usage $0 mutex-name"
#    exit 1
#else
#    # You can just use the file itself to link to!
#    while ! ln $0 "$1-lock" 2>/dev/null; do
#        sleep 1
#    done
#    exit 0
#fi
#
