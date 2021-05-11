#!/usr/bin/bash
## Generate all skripts

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

echo "Dir: $CURRENT_DIR"

find . -iwholename './*/makeBoth.sh' -printf "$CURRENT_DIR/%h\n" > tmpAllDirs.log
find . -iwholename './*/makepdf.sh'  -printf "$CURRENT_DIR/%h\n" >> tmpAllDirs.log

for currdir in `cat tmpAllDirs.log`; do
		cd $currdir
		if [ -f 'makeBoth.sh' ] ; then
				cd ${currdir}
#				PPWWDD=`pwd`
#				echo "I'm in: ${PPWWDD}"
        ./makeBoth.sh
				./clean.sh
		fi

		if [ -f 'makepdf.sh' ] ; then
				cd ${currdir}
#				PPWWDD=`pwd`
#				echo "I'm in: ${PPWWDD}"
        ./makepdf.sh
				./clean.sh
		fi

		echo "... done"
done

rm ${CURRENT_DIR}/tmpAllDirs.log
