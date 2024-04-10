#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
# je 2x für Seitennummern
pdflatex BruchgleichungenArbeitsblatt_ALLG.tex
pdflatex BruchgleichungenArbeitsblatt_ALLG.tex
pdflatex BruchgleichungenArbeitsblatt_TRAINER_ALLG.tex
pdflatex BruchgleichungenArbeitsblatt_TRAINER_ALLG.tex


