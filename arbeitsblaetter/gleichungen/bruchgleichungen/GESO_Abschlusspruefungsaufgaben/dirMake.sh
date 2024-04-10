#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
# je 2x wegen Seitennummern
pdflatex BruchgleichungenGESO_Maturaaufgaben_GESO.tex
pdflatex BruchgleichungenGESO_Maturaaufgaben_GESO.tex
pdflatex BruchgleichungenGESO_Maturaaufgaben_TRAINER_GESO.tex
pdflatex BruchgleichungenGESO_Maturaaufgaben_TRAINER_GESO.tex


