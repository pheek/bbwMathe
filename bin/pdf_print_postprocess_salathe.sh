ifile=${1}

echo "Create printable PDF form File ${ifile}."

gs -dNOPAUSE -dBATCH \
 -sDEVICE=pdfwrite \
 -sOutputFile="${ifile}out.pdf" \
 -dJPEGQ=92 -dQFactor=0.92 \
 -c ".setpdfwrite 25165824 setvmthreshold " \
 -c "<</GrayImageResolution 300/ImageMemory 8388608/AutoRotatePages/None/UCRandBGInfo/Preserve/PreserveOverprintSettings true>> setdistillerparams " \
 -f "${ifile}"
