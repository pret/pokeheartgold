#!/bin/bash
shopt -s nullglob

unreplaced_unrenamed_state=$(cat renames/unreplaced_unrenamed_state.txt 2>/dev/null)
unreplaced_state=${unreplaced_unrenamed_state:0:1}
unrenamed_state=${unreplaced_unrenamed_state:2:3}

if [ "$unreplaced_state" = "1" ] || [ "$unrenamed_state" = "1" ] ; then
	# Make an entire copy of the repo including ONLY files that are tracked and untracked, but not ignored
	# as well as files which the user has to supply
	echo "Finding files to copy over!"
	unignored_files=$(git ls-files --exclude-standard --others --cached)
	tools_bin_files=(tools/bin/*)
	mwccarm_files=(tools/mwccarm/*/*/*.*)
	supplied_files="${tools_bin_files[@]} ${mwccarm_files[@]} tools/mwccarm/license.dat sub/ARM7-TS.lcf.template ARM9-TS.lcf.template mwldarm.response.template"
	files_to_copy="${unignored_files} ${supplied_files}"
	echo "Copying over all modified files!"

	rsync -auW --ignore-missing-args --files-from=<(echo "${files_to_copy}" | tr " " "\n") . rename_repo
	cd rename_repo
	unreplaced_unrenamed_state=$(cat renames/unreplaced_unrenamed_state.txt 2>/dev/null)
	unreplaced_state=${unreplaced_unrenamed_state:0:1}
	unrenamed_state=${unreplaced_unrenamed_state:2:3}
	if [ "$unreplaced_state" = "1" ] ; then
		python3 util/rereplace.py
	fi

	if [ "$unrenamed_state" = "1" ] ; then
		python3 util/rerename_files.py
	fi

	make "$@"

	cd ..
	#echo "need to replace or rename"
else
	make "$@"
	#make "$@"
fi
