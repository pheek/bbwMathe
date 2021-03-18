#!/bin/bash
#
# CREATE PDF from *.tex Files
#
# author phi@freimann.eu
# date   2019-07-11
SKRIPT_BASE_NAME=`ls [GT][EA][SL][OS]_*.tex`
SKRIPT_BASE_NAME=${SKRIPT_BASE_NAME%\.tex}
export ARTICLE_FILE_NAME=${SKRIPT_BASE_NAME}

export ZIELGRUPPE=${ARTICLE_FILE_NAME:0:4}
#export ZIELGRUPPE="TRAINER_GESO"

export MAKE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
../../layout/makeall.sh
