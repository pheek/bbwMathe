#!/bin/bash
#
# CREATE two PDF from *.tex Files one: Trainer, one: Traniee
#
# author phi@freimann.eu
# date   2019-07-11

# GESO oder TALS ?:
SKRIPT_BASE_NAME=`ls *.tex`

SKRIPT_BASE_NAME=${SKRIPT_BASE_NAME%\.tex}

export ARTICLE_FILE_NAME=${SKRIPT_BASE_NAME}

export ZIELGRUPPE="ALLG"
if [ -f './TALS.flag' ] ; then
	export ZIELGRUPPE="TALS"
fi

if [ -f './GESO.flag' ] ; then
	export ZIELGRUPPE="GESO"
fi

export MAKE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

if [ -f '../../layout/makeBoth.sh' ] ; then
. ../../layout/makeBoth.sh
fi

if [ -f '../../../layout/makeBoth.sh' ] ; then
. ../../../layout/makeBoth.sh
fi

if [ -f '../../../../layout/makeBoth.sh' ] ; then
. ../../../../layout/makeBoth.sh
fi

if [ -f '../../../../../layout/makeBoth.sh' ] ; then
. ../../../../../layout/makeBoth.sh
fi
