#!/usr/bin/bash
## Push All Generated Skripts to Webdav

# Pach to 4_Unterrichtsmaterial
# dies sollte auf allen PCS gleich gemountet sein.
PATH_4_UM="/mnt/bms/webdav/coursefolders/_other/MAT_Fachschaft/_courseelementdata/4a_Unterrichtsmaterial/a_nach_Themen/"

echo "Pfad zu Unterrichtsmaterial: ${PATH_4_UM}"

echo "Pusching copies to 4_Unterrichtsmaterial..."
# Pach to 4_Unterrichtsmaterial PATH_4_UM

echo "  Boxplot Arbeitsblatt"
cp -f ./datenanalyse/boxplot/boxplot_ALLG.pdf          ${PATH_4_UM}Stochastik_Datenanalyse/Datenanalyse/Box-Plot/Arbeitsblatt_Boxplot_Erstellen_fp.pdf
cp -f ./datenanalyse/boxplotTI30/boxplotTI30_ALLG.pdf  ${PATH_4_UM}Stochastik_Datenanalyse/Datenanalyse/Box-Plot/TI_30_Boxplot_Daten_auslesen_fp.pdf

echo "  ABC-Finden"
cp -f ./gleichungen/quadratischeGleichungenABC_finden/*.pdf ${PATH_4_UM}Gleichungen/Quadratische_Gleichungen/abc_finden

echo "  Arbeitsblatt potenzgesetze"
cp -f ./algebra/potenzgesetze/*.pdf ${PATH_4_UM}Arithmetik/arbeitsblatt_potenzgesetze_fp

echo "  Arbeitsblatt Potenzgleichungen"
cp -f ./gleichungen/potenzgleichungen/*.pdf ${PATH_4_UM}Gleichungen/Potenzgleichungen

echo "  60 trigo übungen von Jürg"
cp -f ./geometrie/trigonometrie/60Uebungen/60Uebungen_TALS.pdf   ${PATH_4_UM}Geometrie/Trigonometrie/60Uebungen_fp/UebungenSinCosTan.pdf
cp -f ./geometrie/trigonometrie/60Loesungen/60Loesungen_TRAINER_TALS.pdf ${PATH_4_UM}Geometrie/Trigonometrie/60Uebungen_fp/LoesungenSinCosTan.pdf

echo "  Trigonometrische Koordinatensysteme"
cp -f ./geometrie/trigonometrie/trig_coords/Trig_Coords_TALS.pdf ${PATH_4_UM}Geometrie/Trigonometrie/Koordinatensysteme/Trig_Coords.pdf
