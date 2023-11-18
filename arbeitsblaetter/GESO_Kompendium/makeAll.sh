#!/usr/bin/bash
#
# Erstelle GESO Kompenidum
clean.sh
killall evince
rm *.pdf

cp kflagsDEU_Aufgaben_Raster.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_Aufgaben_mit_Raster.pdf

cp kflagsDEU_Aufgaben_Kompakt.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_Aufgaben.pdf

cp kflagsDEU_Aufgaben_BMANiveau.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_BMP_Niveau.pdf

cp kflagsDEU_Loesungen.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_Loesungen.pdf

cp kflagsENG_Aufgaben_Raster.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_Aufgaben_mit_Raster.pdf

cp kflagsENG_Aufgaben_Kompakt.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_Aufgaben.pdf

cp kflagsENG_Aufgaben_BMANiveau.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_BMP_Niveau.pdf

cp kflagsENG_Loesungen.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_Loesungen.pdf

rm kompendium.pdf

evince *.pdf &
clean.sh
