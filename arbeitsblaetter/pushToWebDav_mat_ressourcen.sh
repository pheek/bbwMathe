#!/usr/bin/bash
## Push All Generated Skripts to Webdav


## Finde lehrperson/fp
OLAT_MOUNT_POINTS=`mount | grep olat | awk '{print $3}'`

BBW_WEBDAV_PATH=`ls -l /mnt/ | grep ${OLAT_MOUNT_POINTS} | grep "6_MAT_Ressourcen/\$" | awk '{print $9}'`

echo "BBW_WEBDAV_PATH :: ${BBW_WEBDAV_PATH} ::"

if [ -d "/mnt/${BBW_WEBDAV_PATH}/lehrperson" ] ; then
		echo "found mountpath at /mnt/${BBW_WEBDAV_PATH}"
else
		echo "${BBW_WEBDAV_PATH} not mounted??? exiting..."
		exit
fi

BBW_WEBDAV_PATH=/mnt/${BBW_WEBDAV_PATH}

echo "pushing files into subdirectories 6_MAT_RESSOURCEN : ${BBW_WEBDAV_PATH}..."


echo "copying Taschenrechner (TALS)"
cp -f ./tr_nspire_tals_einfuehrung/TR_NSPIRE_TALS_Einfuehrung_TALS.pdf "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI Nspire CX CAS/TR_NSPIRE_TALS_Einfuehrung_Schueler.pdf"
cp -f ./tr_nspire_tals_einfuehrung/TR_NSPIRE_TALS_Einfuehrung_TRAINER_TALS.pdf "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI Nspire CX CAS/TR_NSPIRE_TALS_Einfuehrung_TRAINER.pdf"


echo "copying Taschenrechner (GESO)"
cp -f ./tr_ti30_geso_einfuehrung/TR_TI30_GESO_Einfuehrung_GESO.pdf  "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI30_PRO_MathPrint/TR_TI30_GESO_Einfuehrung_Schueler.pdf"
cp -f ./tr_ti30_geso_einfuehrung/TR_TI30_GESO_Einfuehrung_TRAINER_GESO.pdf  "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI30_PRO_MathPrint/TR_TI30_GESO_Einfuehrung_Trainer.pdf"
cp -f ./tr_ti30_geso_wichtige_befehle/TR_TI30_GESO_Wichtige_Befehle.pdf  "${BBW_WEBDAV_PATH}/5_Buecher_Lehrmittel_Taschenrechner/Taschenrechner/TI30_PRO_MathPrint/TR_TI30_GESO_Wichtige_Befehle.pdf"


echo "Copyiing Formelsammlung"
GESO_BBW_FS_DIR="${BBW_WEBDAV_PATH}/3_Pruefungen/e_Formelsammlungen/GESO/Formelsammlung_BBW/daily/"
cp -f ./formelsammlung/FormelsammlungGESO_GESO.pdf  "${GESO_BBW_FS_DIR}FormelsammlungGESO_Daily.pdf"
cp -f ./formelsammlung/FormelsammlungGESO_TRAINER_GESO.pdf  "${GESO_BBW_FS_DIR}Working_Draft.pdf"
cp -f ./formelsammlung/FormelsammlungGESO_HECH.pdf  "${GESO_BBW_FS_DIR}FormelsammlungGESO_Daily_hech.pdf"
cp -f ./formelsammlung/FormelsammlungGESO_HECH_TRAINER.pdf  "${GESO_BBW_FS_DIR}Working_Draft_hech.pdf"

