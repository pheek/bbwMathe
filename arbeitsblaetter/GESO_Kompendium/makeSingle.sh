#!/usr/bin/bash
#
# Erstelle GESO Kompenidum
rm *.pdf

lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex

evince *.pdf &

