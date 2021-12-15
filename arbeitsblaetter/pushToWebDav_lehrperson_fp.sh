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

echo "pushing files into subdirectories of : ${BBW_WEBDAV_PATH}..."


echo "copying Boxplot (ALLG)"
cp -f ./boxplot/boxplot_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/datenanalyse/Boxplot/boxplot.pdf

echo "Boxplot for TI 30"
cp -f ./boxplotTI30/boxplotTI30_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/daan/boxplot/boxplotTI30.pdf

echo "Bruchrechnen GESO"
cp -f ./bruchrechnen/GESO_Abschlusspruefungsaufgaben/BruchrechnenGESO_Maturaaufgaben_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/aa1/bruchrechnen/BruchrechenenGESO_Maturaaufgaben.pdf
cp -f ./bruchrechnen/GESO_Abschlusspruefungsaufgaben/BruchrechnenGESO_Maturaaufgaben_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/aa1/bruchrechnen/BruchrechenenGESO_Maturaaufgaben_Trainer.pdf

echo "Befragung Datenanalyse offline"
cp -f ./datenanalyse/befragung/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/datenanalyse/befragung/

echo "copying Finde_den_Fehler (ALLG)"
cp -f ./finde_den_fehler/FindeDenFehler_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/FindeDenFehler.pdf
cp -f ./finde_den_fehler/FindeDenFehler_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/FindeDenFehler_Loesungen.pdf

echo "copying Aufgaben IDAF Formeleditor"
cp -f ./formeleditor/AufgabenFormeleditor_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/idaf/formeleditor/
cp -f ./formeleditor/AufgabenFormeleditor_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/idaf/formeleditor/

echo "copying leere Koordinatensysteme"
echo "erst Koordinatensysteme doppelseitig"
cd funktionen_leere_koordinatensysteme
./doppelseitig.sh
cd ..
cp -f ./funktionen_leere_koordinatensysteme/LeereKoordinatensysteme.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/koordinatensystem/LeereKoordinatensysteme.pdf

echo "copying Lineare Funktionen Arbeitsblatt SAN"
cp -f ./funktionen_lineare_arbeitsblatt/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/lineare_funktionen/ArbeitsblattSAN/

echo "copying Quadratische Gleichungen GESO alte Maturaprüfungen"
cp -f ./gleichungen/quadratischeGleichungen/GESO_Abschlusspruefungsaufgaben/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/gl1/maturapruefungen/

echo "Copying Quadratische Gleichungen ABC-Finden (ALLG)"
cp -f ./gleichungen/quadratischeGleichungenABC_finden/abc_finden_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/abc_finden/abc_finden.pdf
cp -f ./gleichungen/quadratischeGleichungenABC_finden/abc_finden_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/abc_finden/abc_loesungen.pdf


#### GEHT DAS NUN?
echo "Copying Quadratische Gleichungen 14-Schritte nach Gallin (ALLG)"
cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.pdf
cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.mitLoesungen.pdf

#echo "Copying Quadratische Gleichungen 14-Schritte nach Gallin (ALLG)"
#cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.pdf
#cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.mitLoesungen.pdf



echo "Copiing Quadratische funktionen Arbeitsblatt Formne"
cp -f ./funktionen_quadratische_formen/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/fct2/formen

echo "Copying Systematisches Lösen von Textaufgaben (ALLG)"
cp -f ./gleichungen/textaufgaben/Textaufgaben_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/textaufgaben/SystematischesLoesenVonTextaufgaben.pdf

echo "Copying Quadratische Gleichungen mit Photomath (ALLG)"
cp -f ./photomath_quadratische_funktionen/Photomath_quadratische_Funktionen_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/photomath/Photomath_quadratische_Funktionen.pdf

echo "Copying Potenzgesetze Arbeitsblatt (GESO)"
cp -f ./potenzgesetze_geso/Potenzgesetze_GESO.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/potenzgesetze/Potenzgesetze.pdf
cp -f ./potenzgesetze_geso/Potenzgesetze_TRAINER_GESO.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/potenzgesetze/Potenzgesetze_TRAINER.pdf

echo "copying Sin Cos Tan (TALS)"
cp -f ./sin_cos_tan/60Uebungen/60Uebungen_TALS.pdf        ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/60_uebungen/60Uebungen.pdf
cp -f ./sin_cos_tan/60Loesungen/60Loesungen_TALS.pdf      ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/60_uebungen/60Loesungen.pdf
cp -f ./sin_cos_tan/hoehenmessung/Hoehenmessung_TALS.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/Hoehenmessung/Hoehenmessung_TALS.pdf
cp -f ./sin_cos_tan/hoehenmessung/HoehenmessungLeer.ods   ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/Hoehenmessung/HoehenmessungLeer.ods
cp -f ./sin_cos_tan/trig_coords/Trig_Coords_TALS.pdf      ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig3/koordinatensysteme/Trig_Coords.pdf
cp -f ./sin_cos_tan/uebungenBogenmass/*.pdf               ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Bogenmass/arbeitsblattBogenmass/


echo "copying Einheitskreise (TALS)"
cp -f ./sin_cos_tan/einheitskreise/Einheitskreis_TALS.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Einheitskreis/Einheitskreise.pdf
cp -f ./sin_cos_tan/einheitskreis/EinheitskreisB_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Einheitskreis/Einheitskreis.pdf
cp -f ./sin_cos_tan/uebungenAblesen/*.pdf                 ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Einheitskreis/

echo "copying Auftrag Logarithmentabelle (TALS)"
cp -f ./logarithmentabelle/LogarithmenArbeitsblatt_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/spf/aa2/auftrag_logarithmentabelle/AuftragLogarithmentabelle.pdf
cp -f ./logarithmentabelle/LogarithmenArbeitsblatt_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/spf/aa2/auftrag_logarithmentabelle/AuftragLogarithmentabelleLoesungsweg.pdf


