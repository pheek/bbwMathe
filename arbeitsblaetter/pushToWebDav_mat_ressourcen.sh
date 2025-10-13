#!/usr/bin/bash
## Push All Generated Skripts to Webdav

## Finde lehrperson/fp
OLAT_MOUNT_POINTS=`mount | grep olat | awk '{print $3}'`

BBW_WEBDAV_PATH=`ls -l /mnt/ | grep "MAT_Ressourcen/\$" | awk '{print $9}'`

echo "BBW_WEBDAV_PATH :: ${BBW_WEBDAV_PATH} ::"

if [ -d "/mnt/${BBW_WEBDAV_PATH}/lehrperson" ] ; then
		echo "found mountpath at /mnt/${BBW_WEBDAV_PATH}"
else
		echo "${BBW_WEBDAV_PATH} not mounted??? exiting..."
		exit
fi

BBW_WEBDAV_PATH=/mnt/${BBW_WEBDAV_PATH}

echo "pushing files into subdirectories 6_MAT_RESSOURCEN : ${BBW_WEBDAV_PATH}..."

echo "  copying Taschenrechner (TALS)"
cp -f ./taschenrechner/tr_nspire_tals_einfuehrung/TR_NSPIRE_TALS_Einfuehrung_TALS.pdf "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI Nspire CX CAS/TR_NSPIRE_TALS_Einfuehrung_Schueler.pdf"
cp -f ./taschenrechner/tr_nspire_tals_einfuehrung/TR_NSPIRE_TALS_Einfuehrung_TRAINER_TALS.pdf "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI Nspire CX CAS/TR_NSPIRE_TALS_Einfuehrung_TRAINER.pdf"

cp -f ./taschenrechner/tr_nspire_tals_einfuehrung/TR_NSPIRE_TALS_Einfuehrung_TALS.pdf "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI Nspire CX CAS/ausgewählte Anleitungen für SuS/TR_NSPIRE_TALS_Einfuehrung.pdf"

echo "  copying Taschenrechner (GESO)"
cp -f ./taschenrechner/tr_ti30_geso_einfuehrung/TR_TI30_GESO_Einfuehrung_GESO.pdf  "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI30_PRO_MathPrint/TR_TI30_GESO_Einfuehrung_Schueler.pdf"
cp -f ./taschenrechner/tr_ti30_geso_einfuehrung/TR_TI30_GESO_Einfuehrung_TRAINER_GESO.pdf  "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI30_PRO_MathPrint/TR_TI30_GESO_Einfuehrung_Trainer.pdf"
cp -f ./taschenrechner/tr_ti30_geso_wichtige_befehle/TR_TI30_GESO_Wichtige_Befehle_GESO.pdf  "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI30_PRO_MathPrint/TR_TI30_GESO_Wichtige_Befehle.pdf"

echo "  copying Formelsammlung"
GESO_BBW_FS_DIR="${BBW_WEBDAV_PATH}/3_Pruefungen/e_Formelsammlungen/GESO/Formelsammlung_BBW"
cp -f ./formelsammlung/FormelsammlungGESO_RLP.pdf  "${GESO_BBW_FS_DIR}/daily/FormelsammlungGESO_Daily.pdf"
##cp -f ./formelsammlung/FormelsammlungGESO_RLP.pdf  "${GESO_BBW_FS_DIR}FormelsammlungGESO_Daily_RLP.pdf"
cp -f ./formelsammlung/FormelsammlungGESO_GRPH.pdf  "${GESO_BBW_FS_DIR}/mandanten/FormelsammlungGESO_Daily_GRPH.pdf"
cp -f ./formelsammlung/FormelsammlungGESO_BECH.pdf  "${GESO_BBW_FS_DIR}/mandanten/FormelsammlungGESO_Daily_BECH.pdf"
cp -f ./formelsammlung/FormelsammlungGESO_HECH.pdf  "${GESO_BBW_FS_DIR}/mandanten/FormelsammlungGESO_Daily_HECH.pdf"
##cp -f ./formelsammlung/FormelsammlungGESO_DEST.pdf  "${GESO_BBW_FS_DIR}/mandanten/FormelsammlungGESO_Daily_DEST.pdf"


echo "  copying alte Maturaaufgaben sortiert"
echo "    Bruchrechnen: Bruchterme vereinfachen"                                     	
cp -f ./algebra/bruchrechnen/GESO_Abschlusspruefungsaufgaben/*.pdf ${BBW_WEBDAV_PATH}/3_Pruefungen/b_GESO/Abschlusspruefungen/Aufgaben_BMP_GESO_sortiert_nach_Themen/
echo "    Bruchgleichungen, die auf quadratische Gleichungen führen"
##cp -f ./gleichungen/bruchgleichungen/GESO_Abschlusspruefungsaufgaben/*.pdf ${PATH_4_UM}Gleichungen/Quadratische_Gleichungen/Bruchgleichungen/GESO
cp -f ./gleichungen/bruchgleichungen/GESO_Abschlusspruefungsaufgaben/*.pdf ${BBW_WEBDAV_PATH}/3_Pruefungen/b_GESO/Abschlusspruefungen/Aufgaben_BMP_GESO_sortiert_nach_Themen/
