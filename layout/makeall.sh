#!/bin/bash
#
# 2019-07-11
# philipp.freimann@bbw.ch
#
# Create all TeX-Relevant files (index, bibliography)
# and rebuild the pdf.
#

echo "ECHO Starting LAYOUT (includes)"
#export TEX_MAIN_PARENT="${MAKE_DIR}/.."
#echo "Tex Main Parent: ${TEX_MAIN_PARENT}"

export TEX_LAYOUT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
echo "Layout Dir: ${TEX_LAYOUT_DIR}"

TEX_MAIN_PARENT=`realpath "${TEX_LAYOUT_DIR}/.."`
echo "Tex main Parent: ${TEX_MAIN_PARENT}"

export BBW_KAPITEL_DIR=${TEX_MAIN_PARENT}/includes/kapitel
export BBW_PRUEFUNGS_DIR=${TEX_MAIN_PARENT}/pruefungen
export BBW_PRUEFUNGS_AUFGABEN_DIR=${TEX_MAIN_PARENT}/pruefungen/pruefungsAufgaben
export BBW_REPETITIONS_AUFGABEN_DIR=${TEX_MAIN_PARENT}/includes/repetition

declare -x TEXINPUTS="${MAKE_DIR}:${TEX_LAYOUT_DIR}:${BBW_PRUEFUNGS_DIR}:${BBW_PRUEFUNGS_AUFGABEN_DIR}:${BBW_REPETITIONS_AUFGABEN_DIR}:${BBW_KAPITEL_DIR}:"

echo "Tex Inputs: ${TEXINPUTS}"


export POST_PROCESS_DIR=${MAKE_DIR}
export POST_PROCESS_COMMAND="post_process.sh"

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

evince ${ARTICLE_FILE_NAME}.pdf &
