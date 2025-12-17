#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
## je 2x wegen Seitennummern
pdflatex Skalarprodukt_TALS.tex
pdflatex Skalarprodukt_TALS.tex
pdflatex Skalarprodukt_TRAINER_TALS.tex
pdflatex Skalarprodukt_TRAINER_TALS.tex

