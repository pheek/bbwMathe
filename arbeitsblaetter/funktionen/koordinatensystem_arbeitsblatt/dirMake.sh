#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
# alle doppelt erzeugen, damit die Seitennummern generiert werden
pdflatex Koordinatensystem_Arbeitsblatt_ALLG.tex
pdflatex Koordinatensystem_Arbeitsblatt_ALLG.tex
pdflatex Koordinatensystem_Arbeitsblatt_TRAINER_ALLG.tex
pdflatex Koordinatensystem_Arbeitsblatt_TRAINER_ALLG.tex

