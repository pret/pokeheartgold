#!/usr/bin/env bash

# Touch a file only once when it is being created. Otherwise, do nothing.

if [ -z "$1" ]; then
    echo $0: "No argument supplied"; exit 1
fi

if [ ! -f "$1" ]; then
    touch "$1"
fi
