#!/usr/bin/env bash
source support.sh # load support functions & variables
rsync -a --exclude-from="$DIR/support/rsync-exclude.txt" --link-dest=$DIR $DIR/ ~

if is_windows; then
	ln $DIR/.minttyrc ~
else
	ln $DIR/Brewfile ~
fi
