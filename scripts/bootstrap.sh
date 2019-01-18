#!/usr/bin/env bash
# get repo location
DIR="${BASH_SOURCE%/*/*}"
if [[ ! -d "$DIR" ]]; then DIR="${PWD%/*}"; fi

. $DIR/scripts/support.sh # load support functions & variables

if is_windows; then
	exclude=Brewfile
else
	exclude=.minttyrc
fi

rsync -a \
	  --exclude=$exclude \
	  --exclude-from="$DIR/support/rsync-exclude.txt" \
	  --link-dest=$DIR \
	  $DIR/ ~
