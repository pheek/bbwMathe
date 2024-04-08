#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
pdflatex FormelsammlungGESO_BECH.tex
pdflatex FormelsammlungGESO_GRPH.tex
pdflatex FormelsammlungGESO_HECH.tex
pdflatex FormelsammlungGESO_RLP.tex

#Sonderwunsch Steve: Weiße Blätter dazwischen
pdflatex FormelsammlungGESO_DEST.tex
./mkSteve.sh
mv steve.pdf FormelsammlungGESO_DEST.pdf


./clean.sh
