#!/bin/bash
# find all directoies contining "*.aux" AND "clean.sh"
# change to this directories and call "clean.sh"
#

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

echo "Dir: $CURRENT_DIR"

find . -iname '*.aux' -printf "$CURRENT_DIR/%h\n" > tmpAllDirs.log

for currdir in `cat tmpAllDirs.log`; do
		cd $currdir
		if [ -f 'clean.sh' ] ; then
				echo "found clean.sh in $currdir"
				. ./clean.sh
		fi
		
		echo "... done"
done

rm ${CURRENT_DIR}/tmpAllDirs.log
