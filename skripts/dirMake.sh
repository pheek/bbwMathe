l
#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"

# folgender code würde eigentlich nur die LaTeX ertellen, die
# wirklich nötig sind. Leider Leider: läuft latexmk nicht auf meinem
# alten Debian-Server.

latexmk -pdf -silent -use-make ${TEX_FILE_NAME}.tex

#pdflatex  ${TEX_FILE_NAME}.tex
#bibtex    ${TEX_FILE_NAME}.aux
#makeindex ${TEX_FILE_NAME}.idx
#pdflatex  ${TEX_FILE_NAME}.tex
#makeindex ${TEX_FILE_NAME}.idx
#pdflatex  ${TEX_FILE_NAME}.tex
