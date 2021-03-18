#!/bin/bash
#
# 2019-07-11
# philipp.freimann@bbw.ch
#
# Create all TeX-Relevant files (index, bibliography)
# and rebuild the pdf.
#

rm -f ${TEX_LAYOUT_DIR}/zielgruppe.tex
ln -s ${TEX_LAYOUT_DIR}/zielgruppe_${ZIELGRUPPE}.tex ${TEX_LAYOUT_DIR}/zielgruppe.tex

chmod a+x *.sh
chmod a-x *.tex

#. ${TEX_INCLUDES_DIR}/makeall.sh

makeindex ${article}.idx
LATEX_TOOL=pdflatex
#BIBALL=bibAll.bib

echo "First processing ${LATEX_TOOL} .. ${ARTICLE_FILE_NAME}"

#latex ${article}
${LATEX_TOOL} ${ARTICLE_FILE_NAME}

makeindex ${ARTICLE_FILE_NAME}.idx

bibtex ${ARTICLE_FILE_NAME}.aux

chmod u+x ../includes/cleantoc.rb
mv ${ARTICLE_FILE_NAME}.toc ${ARTICLE_FILE_NAME}tmptoc
../includes/cleantoc.rb <${ARTICLE_FILE_NAME}tmptoc >${ARTICLE_FILE_NAME}.toc
rm ${ARTICLE_FILE_NAME}tmptoc

echo "Second processing ${ARTICLE_FILE_NAME}"
${LATEX_TOOL} ${ARTICLE_FILE_NAME}

makeindex ${ARTICLE_FILE_NAME}.idx

# Post Processing

postprocess="${POST_PROCESS_DIR}/${POST_PROCESS_COMMAND}"
echo "Teste, ob ${postprocess} existiert: "
if [ -x ${postprocess} ] 
  then
  echo "Starting Post Processor"
  . ${postprocess}
fi

makeindex ${ARTICLE_FILE_NAME}.idx
${LATEX_TOOL} ${ARTICLE_FILE_NAME}
makeindex ${ARTICLE_FILE_NAME}.idx

${LATEX_TOOL} ${ARTICLE_FILE_NAME}
#lualatex ${ARTICLE_FILE_NAME}

mv ${ARTICLE_FILE_NAME}.pdf ${ARTICLE_FILE_NAME}_${ZIELGRUPPE}.pdf

evince ${ARTICLE_FILE_NAME}_${ZIELGRUPPE}.pdf &
