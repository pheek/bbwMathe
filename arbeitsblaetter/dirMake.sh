##declare -x TEXINPUTS="/home/phi/mgit/cnt/thema:/home/phi/mgit/framework:."
export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
pdflatex Potenzgesetze_GESO_noTRAINER.tex
pdflatex Potenzgesetze_GESO_TRAINER.tex
