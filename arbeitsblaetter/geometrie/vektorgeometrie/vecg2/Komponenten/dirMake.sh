#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
pdflatex Komponenten_TALS.tex
pdflatex Komponenten_TRAINER_TALS.tex

