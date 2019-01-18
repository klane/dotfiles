#!/usr/bin/env bash
# get repo location
DIR="${BASH_SOURCE%/*/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

. $DIR/scripts/support.sh # load support functions & variables
rsync -a --exclude-from="$DIR/support/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~

if is_windows; then
	ln $DIR/.minttyrc ~
else
	ln $DIR/Brewfile ~
fi
