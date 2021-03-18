
#!/bin/bash
#
# CREATE PDF from *.tex Files
#
# author phi@freimann.eu
# date   2019-07-11

export ARTICLE_FILE_NAME="Rueckblick"

export ZIELGRUPPE="TALS"
#export ZIELGRUPPE="TRAINER_TALS"

export MAKE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
../../layout/makeall.sh
