rm -f *.pdf

# Version Rahmenlehrplan (RLP)
cp VERSION_RLP.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_RLP.pdf


# Hersberger Christian (HECH)
cp VERSION_HECH.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_HECH.pdf

# Deubelbeiss Steve (DEST)
cp VERSION_DEST.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_DEST.pdf
#
# Spezialwunsch steve: 4 a6 pro a4
# 
./mkSteve.sh
mv steve.pdf FormelsammlungGESO_DEST.pdf


# Benz Christoph (BECH)
cp VERSION_BECH.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_BECH.pdf

# Freimann Gressly Philipp (GRPH)
cp VERSION_GRPH.txt VERSION.sty
. ./superMakeBoth.sh
mv FormelsammlungGESO_GESO.pdf FormelsammlungGESO_GRPH.pdf
mv FormelsammlungGESO_TRAINER_GESO.pdf FormelsammlungGESO_TRAINER.pdf



## remove doc_data.txt
rm ./doc_data.txt
