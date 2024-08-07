#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
pdflatex Geradengleichung_TALS.tex
pdflatex Geradengleichung_TALS.tex
pdflatex Geradengleichung_TRAINER_TALS.tex
pdflatex Geradengleichung_TRAINER_TALS.tex

