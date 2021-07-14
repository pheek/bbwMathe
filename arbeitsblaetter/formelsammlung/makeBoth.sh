rm -f *.pdf
cp VERSION_HECH.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_HECH.pdf
mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_HECH_TRAINER.pdf


cp VERSION_RLP.txt VERSION.sty
. ./superMakeBoth.sh

