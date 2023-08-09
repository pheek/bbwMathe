#!/bin/bash
#
# CREATE two PDF from *.tex Files one: Trainer, one: Traniee
#
# author phi@freimann.eu
# date   2019-07-11

# GESO oder TALS ?:
# a) Suche nur GESO***.tex oder tals***.tex etc.
#    alle anderen wie anhang.tex etc. werden ignoriert
# b) Zielgruppe hann aus dem Basename erstellt werden, wenn kein
#    GESO.flag oder TALS.flag vorhanden ist.
SKRIPT_BASE_NAME=`ls [gGtT][eEaA][sSlL][oOsS]_*.tex`

SKRIPT_BASE_NAME=${SKRIPT_BASE_NAME%\.tex}

export ARTICLE_FILE_NAME=${SKRIPT_BASE_NAME}


## Zielgruppe TALS oder GESO
export ZIELGRUPPE=${ARTICLE_FILE_NAME:0:4}

## Zielgruppe kann per FLAG übersteuert werden
if [ -f './TALS.flag' ] ; then
	export ZIELGRUPPE="TALS"
fi

if [ -f './GESO.flag' ] ; then
	export ZIELGRUPPE="GESO"
fi


## show endresult with evince
export SHOW_COMMAND_FOR_PDF='evince'
if [ "WAHR" == ${MAKE_ALL_AT_ONCE} ] ; then
	 export SHOW_COMMAND_FOR_PDF=:
fi


export MAKE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

echo "actual make dir: ${MAKE_DIR}"

. ../../../framework/bin/makeBoth.sh
