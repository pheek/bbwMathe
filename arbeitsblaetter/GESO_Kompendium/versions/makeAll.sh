#!/usr/bin/bash
#
# Erstelle GESO Kompenidum

cd ..

clean.sh
#killall evince
#rm *.pdf

#cp versions/kflagsDEU_Aufgaben_Raster.tex kflags.tex
#lualatex kompendium.tex
#makeindex kompendium.idx
#lualatex kompendium.tex
#cp kompendium.pdf kompendium_Deutsch_Aufgaben_mit_Raster.pdf

cp versions/kflagsDEU_Aufgaben_Kompakt.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_Aufgaben.pdf

cp versions/kflagsDEU_Aufgaben_BMANiveau.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_BMP_Niveau.pdf

cp versions/kflagsDEU_Loesungen.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_Deutsch_Loesungen.pdf

#cp versions/kflagsENG_Aufgaben_Raster.tex kflags.tex
#lualatex kompendium.tex
#makeindex kompendium.idx
#lualatex kompendium.tex
#cp kompendium.pdf kompendium_English_Aufgaben_mit_Raster.pdf

cp versions/kflagsENG_Aufgaben_Kompakt.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_Aufgaben.pdf

cp versions/kflagsENG_Aufgaben_BMANiveau.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_BMP_Niveau.pdf

cp versions/kflagsENG_Loesungen.tex kflags.tex
lualatex kompendium.tex
makeindex kompendium.idx
lualatex kompendium.tex
cp kompendium.pdf kompendium_English_Loesungen.pdf

rm kompendium.pdf
mv *.pdf versions
./clean.sh

cp kflags_MASTER.tex kflags.tex

cd versions
evince *.pdf &
