
#!/usr/bin/bash
# Transition 2024
# uses no "Zielgruppe" any more.

export TEXINPUTS=".:/home/phi/mgit/framework:/home/phi/mgit/cnt/thema:"
export TEX_FILE_NAME="Koerper_TALS"
../../../dirMake2.sh
export TEX_FILE_NAME="Koerper_TRAINER_TALS"
../../../dirMake2.sh
