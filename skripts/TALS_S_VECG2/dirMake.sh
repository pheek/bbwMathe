#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
pdflatex TALS_S_VECG2_TALS.tex
pdflatex TALS_S_VECG2_TALS_TRAINER.tex

