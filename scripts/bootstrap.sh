#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*/*}" # get repo location
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

. $DIR/scripts/support.sh # load support functions & variables
rsync -a --exclude-from="$DIR/support/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~

if is_windows; then
	ln $DIR/.minttyrc ~
else
	ln $DIR/Brewfile ~
fi
