#!/usr/bin/bash
#
# Erstelle GESO Kompenidum
rm *.pdf

pdflatex kompendium.tex
makeindex kompendium.idx
pdflatex kompendium.tex

evince *.pdf &

