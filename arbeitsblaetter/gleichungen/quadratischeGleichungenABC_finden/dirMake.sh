#!/usr/bin/bash
65;7400;1c# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
## 2x für Seitennummern
pdflatex abc_finden_ALLG.tex
pdflatex abc_finden_ALLG.tex
## nur 1x, da auf einer Seite Platz
pdflatex abc_finden_TRAINER_ALLG.tex


