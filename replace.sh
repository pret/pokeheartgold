#!/bin/bash
# $1: phrase to find
# $2: phrase to replace $1

force=
dryrun=
args=()
for arg; do
	shift
	case $arg in
		-y )
			force=1 ;;
		-n )
			dryrun=echo ;;
		* )
			args+=("$arg") ;;
	esac
done

if [ "${#args[@]}" -ne 2 ]; then
	echo "Usage: replace.sh [-y] [PHRASE TO FIND] [PHRASE TO REPLACE PHRASE TO FIND]"
	exit 1
fi

git grep -w "${args[0]}" >/dev/null
if [ "$?" -ne 0 ]; then
	echo "nothing to do"
	exit 0
fi

if [ -z "$force" ]; then
	git grep -w "${args[1]}" >/dev/null
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
fi

set -e

if [ "$(uname -s)" == "Darwin" ]; then
	SED="$(which gsed)"
else
	SED="$(which sed)"
fi

$dryrun ${SED} -i 's/\<'"${args[0]}"'\>/'"${args[1]}"'/g' $(git grep -Ilwr "${args[0]}")
