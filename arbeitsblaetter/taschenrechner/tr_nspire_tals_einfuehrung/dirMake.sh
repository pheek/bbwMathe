#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
## je 2x wegen Seitennummern
pdflatex TR_NSPIRE_TALS_Einfuehrung_TALS.tex
pdflatex TR_NSPIRE_TALS_Einfuehrung_TALS.tex
pdflatex TR_NSPIRE_TALS_Einfuehrung_TRAINER_TALS.tex
pdflatex TR_NSPIRE_TALS_Einfuehrung_TRAINER_TALS.tex



