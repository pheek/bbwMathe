#!/usr/bin/bash
#
# Erstelle GESO Kompenidum
rm *.pdf

cp -f kflags_MASTER.tex kflags.tex

pdflatex kompendium.tex
makeindex kompendium.idx
pdflatex kompendium.tex

evince *.pdf &

