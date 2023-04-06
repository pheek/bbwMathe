rm -f *.pdf

cp VERSION_HECH.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_HECH.pdf
#mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_HECH_TRAINER.pdf

cp VERSION_RLP.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_RLP.pdf
#mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_RLP_TRAINER.pdf

cp VERSION_STEVE.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_STEVE.pdf
#mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_STEVE_TRAINER.pdf

cp VERSION_BECH.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_BECH.pdf
#mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_BECH_TRAINER.pdf

cp VERSION_FP.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_FP.pdf
#mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_FP_TRAINER.pdf



