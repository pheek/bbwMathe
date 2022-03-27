#!/usr/bin/bash
## Push All Generated Skripts to Webdav

# Pach to 4_Unterrichtsmaterial
# dies sollte auf allen PCS gleich gemountet sein.
PATH_4_UM="/mnt/bbw/webdav/coursefolders/_other/6_MAT_Fachschaft/_courseelementdata/4_Unterrichtsmaterial/a_nach_Themen/"
echo "Pfad zu Unterrichtsmaterial: ${PATH_4_UM}"


echo "Pusching copies to 4_Unterrichtsmaterial..."
# Pach to 4_Unterrichtsmaterial PATH_4_UM

echo "  Boxplot Arbeitsblatt"
cp -f ./boxplot/boxplot_ALLG.pdf          ${PATH_4_UM}Stochastik_Datenanalyse/Datenanalyse/Box-Plot/Arbeitsblatt_Boxplot_Erstellen_fp.pdf
cp -f ./boxplotTI30/boxplotTI30_ALLG.pdf  ${PATH_4_UM}Stochastik_Datenanalyse/Datenanalyse/Box-Plot/TI_30_Boxplot_Daten_auslesen_fp.pdf

echo "  Bruchrechnen: Bruchterme vereinfachen"
cp -f ./bruchrechnen/GESO_Abschlusspruefungsaufgaben/*.pdf ${PATH_4_UM}Aufgaben_BMP_GESO/

echo "  Bruchgleichungen, die auf quadratische Gleichungen führen"
cp -f ./bruchgleichungen/GESO_Abschlusspruefungsaufgaben/*.pdf ${PATH_4_UM}Gleichungen/Quadratische_Gleichungen/Bruchgleichungen/GESO
cp -f ./bruchgleichungen/GESO_Abschlusspruefungsaufgaben/*.pdf ${PATH_4_UM}Aufgaben_BMP_GESO/

echo "  ABC-Finden"
cp -f ./gleichungen/quadratischeGleichungenABC_finden/*.pdf ${PATH_4_UM}Gleichungen/Quadratische_Gleichungen/abc_finden

echo "  Arbeitsblatt potenzgesetze"
cp -f ./potenzgesetze_geso/*.pdf ${PATH_4_UM}Arithmetik/arbeitsblatt_potenzgesetze_fp

echo "  Arbeitsblatt Potenzgleichungen"
cp -f ./potenzgleichungen/*.pdf ${PATH_4_UM}Gleichungen/Potenzgleichungen

echo "  60 trigo übungen von Jürg"
cp -f ./sin_cos_tan/60Uebungen/60Uebungen_TALS.pdf   ${PATH_4_UM}Geometrie/Trigonometrie/60Uebungen_fp/UebungenSinCosTan.pdf
cp -f ./sin_cos_tan/60Loesungen/60Loesungen_TALS.pdf ${PATH_4_UM}Geometrie/Trigonometrie/60Uebungen_fp/LoesungenSinCosTan.pdf

echo "  Trigonometrische Koordinatensysteme"
cp -f ./sin_cos_tan/trig_coords/Trig_Coords_TALS.pdf ${PATH_4_UM}Geometrie/Trigonometrie/Koordinatensysteme/Trig_Coords.pdf
