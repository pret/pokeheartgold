#!/bin/bash
# $1: phrase to find
# $2: phrase to replace $1
if [ "$1" = "" -o "$2" = "" ]; then
	echo "Usage: replace.sh [PHRASE TO FIND] [PHRASE TO REPLACE PHRASE TO FIND]"
	exit 1
fi

git grep -w "$1" >/dev/null
if [ "$?" -ne 0 ]; then
	echo "nothing to do"
	exit 0
fi

git grep -w "$2" >/dev/null
if [ "$?" -eq 0 ]; then
	read -p "Replacement symbol already exists. Proceed anyway? [y/N] " yn
	case $yn in
		[yY] )
			;;
		* )
			echo Aborting.
			exit 0 ;;
	esac
fi

set -e

if [ "$(uname -s)" == "Darwin" ]; then
	SED="$(which gsed)"
else
	SED="$(which sed)"
fi

${SED} -i 's/\<'"$1"'\>/'"$2"'/g' $(git grep -Ilwr "$1")
