#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"

./clean.sh

rm *.pdf

pdflatex Extremwerte_TALS.tex
pdflatex Extremwerte_TALS.tex

pdflatex Extremwerte_TRAINER_TALS.tex
pdflatex Extremwerte_TRAINER_TALS.tex

./clean.sh
