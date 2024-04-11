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

if [ -f '../../layout/makeall.sh' ] ; then
. ../../layout/makeall.sh
fi

if [ -f '../../../layout/makeall.sh' ] ; then
. ../../../layout/makeall.sh
fi

if [ -f '../../../../layout/makeall.sh' ] ; then
. ../../../../layout/makeall.sh
fi

if [ -f '../../../../../layout/makeall.sh' ] ; then
. ../../../../../layout/makeall.sh
fi



#!/bin/bash
#
# CREATE PDF from *.tex Files
#
# author phi@freimann.eu
# date   2019-07-11

#export ARTICLE_FILE_NAME="QuadratischeGleichung"
#export ZIELGRUPPE="GESO"
#   #export ZIELGRUPPE="TRAINER_GESO"

#export MAKE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
#../../../../../layout/makeall.sh
