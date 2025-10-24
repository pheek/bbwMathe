#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"

latexmk -pdf -silent -use-make ${TEX_FILE_NAME}.tex

#pdflatex  ${TEX_FILE_NAME}.tex
#pdflatex  ${TEX_FILE_NAME}.tex
