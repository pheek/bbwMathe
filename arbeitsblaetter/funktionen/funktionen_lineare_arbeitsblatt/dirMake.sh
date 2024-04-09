#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
## je 2x wegen Seitennummrn
pdflatex Funktionen_Lineare_Arbeitsblatt_ALLG.tex
pdflatex Funktionen_Lineare_Arbeitsblatt_ALLG.tex
pdflatex Funktionen_Lineare_Arbeitsblatt_TRAINER_ALLG.tex
pdflatex Funktionen_Lineare_Arbeitsblatt_TRAINER_ALLG.tex
