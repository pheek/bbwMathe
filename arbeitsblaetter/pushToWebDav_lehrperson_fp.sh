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


echo "  copying Boxplot (ALLG)"
cp -f ./datenanalyse/boxplot/boxplot_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/datenanalyse/Boxplot/boxplot.pdf
cp -f ./datenanalyse/boxplot/boxplot_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/datenanalyse/Boxplot/boxplot_Loesungen.pdf

echo "  Boxplot for TI 30"
cp -f ./datenanalyse/boxplotTI30/boxplotTI30_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/daan/boxplot/boxplotTI30.pdf

echo "  Bruchrechnen GESO"
cp -f ./algebra/bruchrechnen/GESO_Abschlusspruefungsaufgaben/BruchrechnenGESO_Maturaaufgaben_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/aa1/bruchrechnen/BruchrechenenGESO_Maturaaufgaben.pdf
cp -f ./algebra/bruchrechnen/GESO_Abschlusspruefungsaufgaben/BruchrechnenGESO_Maturaaufgaben_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/aa1/bruchrechnen/BruchrechenenGESO_Maturaaufgaben_Trainer.pdf

echo "  Bruchrechnen Arbeitsblatt 1: Wann Kürzen"
cp -f ./algebra/bruchrechnen/WannBruecheKuerzen/WannBruecheKuerzen_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/bruchrechnen/wannKuerzen/WannBruecheKuerzen_ALLG.pdf
cp -f ./algebra/bruchrechnen/WannBruecheKuerzen/WannBruecheKuerzen_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/bruchrechnen/wannKuerzen/WannBruecheKuerzen_TRAINER_ALLG.pdf

echo "  Befragung Datenanalyse offline"
cp -f ./datenanalyse/befragung/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/datenanalyse/befragung/

echo "  copying Finde_den_Fehler (ALLG)"
cp -f ./finde_den_fehler/FindeDenFehler_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/FindeDenFehler.pdf
cp -f ./finde_den_fehler/FindeDenFehler_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/FindeDenFehler_Loesungen.pdf

echo "  copying Aufgaben IDAF Formeleditor"
cp -f ./formeleditor/AufgabenFormeleditor_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/idaf/formeleditor/
cp -f ./formeleditor/AufgabenFormeleditor_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/idaf/formeleditor/

echo "  copying leere Koordinatensysteme"
echo "  erst Koordinatensysteme doppelseitig"
cd funktionen/funktionen_leere_koordinatensysteme
./doppelseitig.sh
cd ../..
cp -f ./funktionen/funktionen_leere_koordinatensysteme/LeereKoordinatensysteme.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/koordinatensystem/LeereKoordinatensysteme.pdf

echo "  copying Begriffe Koordinatensystem Selbsteinschätzung"
cp -f ./funktionen/begriffe/Begriffe_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/einstieg/begriffe/Begriffe.pdf

echo "  copying Koordinatensystem Arbeitsblatt"
cp -f ./funktionen/koordinatensystem_arbeitsblatt/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/koordinatensystem/arbeitsblatt/

echo "  copying Funktionsbegriff Arbeitsblatt"
cp -f ./funktionen/funktionsbegriff_arbeitsblatt/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/funktionsbegriff/

echo "  copying Lineare Funktionen Arbeitsblatt SAN"
cp -f ./funktionen/funktionen_lineare_arbeitsblatt/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/lineare_funktionen/ArbeitsblattSAN/

echo "  copying Quadratische Gleichungen GESO alte Maturaprüfungen"
cp -f ./gleichungen/quadratischeGleichungen/GESO_Abschlusspruefungsaufgaben/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/gl1/maturapruefungen/

echo "  Copying Quadratische Gleichungen ABC-Finden (ALLG)"
cp -f ./gleichungen/quadratischeGleichungenABC_finden/abc_finden_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/abc_finden/abc_finden.pdf
cp -f ./gleichungen/quadratischeGleichungenABC_finden/abc_finden_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/abc_finden/abc_loesungen.pdf


#### GEHT DAS NUN?
echo "  Copying Quadratische Gleichungen 14-Schritte nach Gallin (ALLG)"
cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.pdf
cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.mitLoesungen.pdf


echo "  Copying Quadratische Gleichungen Einführung zur Quadr. Ergänzung (ALLG)"
cp -f ./gleichungen/einfuehrung_ergaenzung_formel/QuadratischeGleichung_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/EinfuerhungErgaenzung/QuadratischeGleichungEinfuerhungErgaenzung.pdf
cp -f ./gleichungen/einfuehrung_ergaenzung_formel/QuadratischeGleichung_TRAINER_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/EinfuerhungErgaenzung/QuadratischeGleichungEinfuerhungErgaenzung_TRAINER.pdf

#echo "Copying Quadratische Gleichungen 14-Schritte nach Gallin (ALLG)"
#cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.pdf
#cp -f ./gleichungen/quadratische_gleichung_gallin/QuadratischeGleichung_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/14Schritte/QuadratischeGleichung.mitLoesungen.pdf


echo "  Copying Lernen mit Wappen"
cp -f ./lernenMitWappen/lernen_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/lernen/LernenMitWappen.pdf

echo "  Copying Quadratische funktionen Arbeitsblatt Formen"
cp -f ./funktionen/funktionen_quadratische_formen/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/fct2/formen

echo "  Copying Systematisches Lösen von Textaufgaben (ALLG)"
cp -f ./gleichungen/textaufgaben/Textaufgaben_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/textaufgaben/SystematischesLoesenVonTextaufgaben.pdf

echo "  Copying Quadratische Gleichungen mit Photomath (ALLG)"
cp -f ./photomath_quadratische_funktionen/Photomath_quadratische_Funktionen_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/quadratische/arbeitsblaetter/photomath/Photomath_quadratische_Funktionen.pdf

echo "  Copying Potenzgesetze Arbeitsblatt (GESO)"
cp -f ./algebra/potenzgesetze_geso/Potenzgesetze_GESO.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/potenzgesetze/Potenzgesetze.pdf
cp -f ./algebra/potenzgesetze_geso/Potenzgesetze_TRAINER_GESO.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/potenzgesetze/Potenzgesetze_TRAINER.pdf

echo "  Copying Runden (algebra/zahlmengen/ordnungsrelationen) (ALLG)"
cp -f ./algebra/zahlmengen/ordnungsrelationen/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/zahlmengen/ordnungsrelationen

echo "  Copying Runden (algebra/zahlmengen/runden) (ALLG)"
cp -f ./algebra/zahlmengen/runden/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/zahlmengen/runden

echo "  Copying Potenzgleichungen Arbeitsblatt (ALLG)"
cp -f ./gleichungen/potenzgleichungen/Potenzgleichungen_ALLG.pdf         ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/potenzgleichungen/Potenzgleichungen.pdf
cp -f ./gleichungen/potenzgleichungen/Potenzgleichungen_TRAINER_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/potenzgleichungen/Potenzgleichungen_TRAINER.pdf

echo "  copying Sin Cos Tan (TALS)"
cp -f ./geometrie/trigonometrie/60Uebungen/60Uebungen_TALS.pdf        ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/60_uebungen/60Uebungen.pdf
cp -f ./geometrie/trigonometrie/60Loesungen/60Loesungen_TALS.pdf      ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/60_uebungen/60Loesungen.pdf
cp -f ./geometrie/trigonometrie/hoehenmessung/Hoehenmessung_TALS.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/Hoehenmessung/Hoehenmessung_TALS.pdf
cp -f ./geometrie/trigonometrie/hoehenmessung/HoehenmessungLeer.ods   ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig1/Hoehenmessung/HoehenmessungLeer.ods
cp -f ./geometrie/trigonometrie/trig_coords/Trig_Coords_TALS.pdf      ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig3/koordinatensysteme/Trig_Coords.pdf
cp -f ./geometrie/trigonometrie/uebungenBogenmass/*.pdf               ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Bogenmass/arbeitsblattBogenmass/

echo "  copying Einheitskreise (TALS)"
cp -f ./geometrie/trigonometrie/einheitskreise/Einheitskreis_TALS.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Einheitskreis/Einheitskreise.pdf
cp -f ./geometrie/trigonometrie/einheitskreis/EinheitskreisB_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Einheitskreis/Einheitskreis.pdf
cp -f ./geometrie/trigonometrie/uebungenAblesen/*.pdf                 ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/glf/trig2/Einheitskreis/

echo "  copying Auftrag Logarithmentabelle (TALS)"
cp -f ./algebra/logarithmentabelle/LogarithmenArbeitsblatt_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/spf/aa2/auftrag_logarithmentabelle/AuftragLogarithmentabelle.pdf
cp -f ./algebra/logarithmentabelle/LogarithmenArbeitsblatt_TRAINER_ALLG.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/spf/aa2/auftrag_logarithmentabelle/AuftragLogarithmentabelleLoesungsweg.pdf

echo "  copying Arbeitsblatt Algebra I Grundoperationen (GESO und TALS)"
cp -f ./algebra/algebra1Grundoperationen/A1G_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/grundoperationen/A1G_Aufgaben.pdf
cp -f ./algebra/algebra1Grundoperationen/A1G_TRAINER_ALLG.pdf   ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/grundoperationen/A1G_Loesungen.pdf

echo "  copying Arbeitsblatt Algebra I Terme (GESO und TALS)"
cp -f ./algebra/terme/*.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/terme/

echo "  copying Arbeitsblatt Algebra I Betrag (GESO und TALS)"
cp -f ./algebra/algebra1Betrag/A1Be_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/betrag/A1Be_Aufgaben.pdf
cp -f ./algebra/algebra1Betrag/A1Be_TRAINER_ALLG.pdf   ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/betrag/A1Be_Loesungen.pdf

echo "  copying Arbeitsblatt Algebra I Binomische Formeln (GESO und TALS)"
cp -f ./algebra/algebra1BinomischeFormeln/A1Bi_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/binomischeFormeln/A1Bi_Aufgaben.pdf
cp -f ./algebra/algebra1BinomischeFormeln/A1Bi_TRAINER_ALLG.pdf   ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/binomischeFormeln/A1Bi_Loesungen.pdf

echo "  copying Arbeitsblatt Algebra I Faktorisieren (GESO und TALS)"
cp -f ./algebra/algebra1Faktorisieren/A1F_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/faktorisieren/A1F_Aufgaben.pdf
cp -f ./algebra/algebra1Faktorisieren/A1F_TRAINER_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/algebra/faktorisieren/A1F_Loesungen.pdf

echo "  copying Arbeitsblatt Gleichungen: Bruchgleichungen (GESO und TALS)"
cp -f ./gleichungen/bruchgleichungen/arbeitsblatt/BruchgleichungenArbeitsblatt_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/bruchgleichungen/arbeitsblatt/BruchgleichungenArbeitsblatt.pdf
cp -f ./gleichungen/bruchgleichungen/arbeitsblatt/BruchgleichungenArbeitsblatt_TRAINER_ALLG.pdf           ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/bruchgleichungen/arbeitsblatt/BruchgleichungenArbeitsblattLoesungen.pdf

echo "  copying Umkehrfunktionen (GESO und TALS)"
cp -f ./funktionen/funktionen_umkehrfunktionen/Umkehrfunktionen_TALS.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/spf/fct3/umkehrfunktionen/ArbeitsblattUmkehrfunktionen.pdf
cp -f ./funktionen/funktionen_umkehrfunktionen/Umkehrfunktionen_TRAINER_TALS.pdf  ${BBW_WEBDAV_PATH}/lehrperson/fp/i_tals/thema/spf/fct3/umkehrfunktionen/ArbeitsblattUmkehrfunktionenLoesungen.pdf

echo "  copying Arbeitsblatt Gleichungen: Exponentialgleichungen (GESO und TALS)"
cp -f ./gleichungen/exponentialgleichungen/Exponentialgleichungen_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/exponentialgleichungen/arbeitsblatt/ExponentialgleichungenArbeitsblatt.pdf
cp -f ./gleichungen/exponentialgleichungen/Exponentialgleichungen_TRAINER_ALLG.pdf          ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/gleichungen/exponentialgleichungen/arbeitsblatt/ExponentialgleichungenArbeitsblattLoesungen.pdf

echo "  copying Arbeitsblatt Exponentialfunktionen (GESO und TALS)"
cp -f ./funktionen/exponentialfct/*.pdf                               ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/thema/funktionen/exponentialfunktion/arbeitsblatt/

echo "  copying Mengenbezeichnungen (GESO und TALS)"
cp -f ./mengenbegriffe/Mengenbezeichnungen_ALLG.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/mengenbezeichnungen/Mengenbezeichnungen.pdf

echo "  copying Denksport (ALLG"
cp -f ./denksport/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_allg/denksport/

echo "  copying Hypothesentest (GESO)"
cp -f ./stochastik/hypothesentest/*.pdf ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/stoch/hypothesentest/
cp -f ./stochastik/hypothesentest/*.ods ${BBW_WEBDAV_PATH}/lehrperson/fp/i_geso/thema/stoch/hypothesentest/




