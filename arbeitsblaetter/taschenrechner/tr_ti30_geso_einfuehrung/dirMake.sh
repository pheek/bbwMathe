#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
## je 2x wegen Seitennummern
pdflatex TR_TI30_GESO_Einfuehrung_GESO.tex
pdflatex TR_TI30_GESO_Einfuehrung_GESO.tex
pdflatex TR_TI30_GESO_Einfuehrung_TRAINER_GESO.tex
pdflatex TR_TI30_GESO_Einfuehrung_TRAINER_GESO.tex




