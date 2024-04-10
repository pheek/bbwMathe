#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
## je 2x für Seitennummern
pdflatex Exponentialgleichungen_ALLG.tex
pdflatex Exponentialgleichungen_ALLG.tex
pdflatex Exponentialgleichungen_TRAINER_ALLG.tex
pdflatex Exponentialgleichungen_TRAINER_ALLG.tex


