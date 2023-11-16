#!/usr/bin/bash
#
# Erstelle GESO Kompenidum
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex

evince kompendium.pdf
