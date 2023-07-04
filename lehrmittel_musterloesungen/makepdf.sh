
#!/bin/bash
#
# CREATE PDF from *.tex Files
#
# author phi@freimann.eu
# date   2019-07-11

export ARTICLE_FILE_NAME="MTA_S157_A044_fp"
export ZIELGRUPPE="GESO"
#export ZIELGRUPPE="TRAINER_GESO"

export MAKE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
../../../framework/bin/makeall.sh


export ARTICLE_FILE_NAME="MTA_S181_A7e_fp"
../../../framework/bin/makeall.sh
