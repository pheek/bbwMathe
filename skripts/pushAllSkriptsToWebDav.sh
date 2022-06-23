#!/usr/bin/bash
## Push All Generated Skripts to Webdav

OLAT_MOUNT_POINTS=`mount | grep olat | awk '{print $3}'`

echo "OLAT_MOUNT_POINTS:: ${OLAT_MOUNT_POINTS} ::"

BBW_WEBDAV_PATH=`ls -l /mnt/ | grep "${OLAT_MOUNT_POINTS}" | grep "6_MAT_Ressourcen/\$" | awk '{print $9}'`

echo "BBW_WEBDAV_PATH hier gefunden:  ${BBW_WEBDAV_PATH} ::"

if [ -d "/mnt/${BBW_WEBDAV_PATH}/lehrperson" ] ; then
		echo "found mountpath at /mnt/${BBW_WEBDAV_PATH}"
else
		echo "${BBW_WEBDAV_PATH} not mounted??? exiting..."
		echo "mounting ..."
    sudo /home/phi/bin/net/bbw_up_webdav.sh
 
    OLAT_MOUNT_POINTS=`mount | grep olat | awk '{print $3}'`
    BBW_WEBDAV_PATH=`ls -l /mnt/ | grep "${OLAT_MOUNT_POINTS}" | grep "6_MAT_Ressourcen/\$" | awk '{print $9}'`

#   exit
fi


BBW_WEBDAV_PATH_FP=/mnt/${BBW_WEBDAV_PATH}/lehrperson/fp

echo "pushing skripts into: ${BBW_WEBDAV_PATH_FP}"


echo "copying GESO gesamtes Skript"
cp -f ./GESO_1J/*.pdf      ${BBW_WEBDAV_PATH_FP}/i_geso/skripts
cp -f ./GESO_2J/*.pdf      ${BBW_WEBDAV_PATH_FP}/i_geso/skripts
cp -f ./GESO_3J/*.pdf      ${BBW_WEBDAV_PATH_FP}/i_geso/skripts
cp -f ./GESO_BLENDED/*.pdf /mnt/${BBW_WEBDAV_PATH}/6_Blended_Learning/skripts


echo 'copying GESO Kapitel...'
cp -f ./GESO_S_AA1/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_geso/thema/aa1/skript
cp -f ./GESO_S_AA2/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_geso/thema/aa2/skript
cp -f ./GESO_S_AA3/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_geso/thema/aa3/skript
cp -f ./GESO_S_DAAN/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_geso/thema/daan/skript
cp -f ./GESO_S_FCT1/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_geso/thema/fct1/skript
cp -f ./GESO_S_FCT2/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_geso/thema/fct2/skript
cp -f ./GESO_S_GL1/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_geso/thema/gl1/skript
cp -f ./GESO_S_GL2/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_geso/thema/gl2/skript
cp -f ./GESO_S_GLS/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_geso/thema/gls/skript
cp -f ./GESO_S_STOCH/*.pdf ${BBW_WEBDAV_PATH_FP}/i_geso/thema/stoch/skript

echo 'copying GESO Einzelkapitel'
cp -f ./GESO_S_Faktorisieren/*.pdf ${BBW_WEBDAV_PATH_FP}/i_geso/thema/aa1/faktorisieren


echo "copying TALS gesamtes Skript"
cp -f ./TALS_4J_GLF_ALL/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/skripts
cp -f ./TALS_4J_SPF_ALL/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/skripts


echo 'copying TALS GLF Kapitel...'
cp -f ./TALS_S_AA1/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/aa1/skript
cp -f ./TALS_S_DAAN/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/daan/skript
cp -f ./TALS_S_FCT1/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/fct1/skript
cp -f ./TALS_S_FCT2/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/fct2/skript
cp -f ./TALS_S_GL1/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/gl1/skript
cp -f ./TALS_S_GL2/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/gl2/skript
cp -f ./TALS_S_GLS/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/gls/skript
cp -f ./TALS_S_PLANI/*.pdf ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/plani/skript
cp -f ./TALS_S_TRIG1/*.pdf ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/trig1/skript
cp -f ./TALS_S_TRIG2/*.pdf ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/trig2/skript
cp -f ./TALS_S_TRIG3/*.pdf ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/trig3/skript
cp -f ./TALS_S_TRIG4/*.pdf ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/trig4/skript
cp -f ./TALS_S_UNGL/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/ungl/skript

echo 'copying TALS SPF Kapitel...'
cp -f ./TALS_S_AA2/*.pdf   ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/aa2/skript
cp -f ./TALS_S_FCT3/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/fct3/skript
cp -f ./TALS_S_FCT4/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/fct4/skript
cp -f ./TALS_S_GL3_1/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/gl3_1/skript
cp -f ./TALS_S_GL3_2/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/gl3_2/skript
cp -f ./TALS_S_STEREO/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/stereo/skript
cp -f ./TALS_S_VECG1/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/vecg1/skript
cp -f ./TALS_S_VECG2/*.pdf  ${BBW_WEBDAV_PATH_FP}/i_tals/thema/spf/vecg2/skript

echo 'copying TALS Einzelkapitel'
cp -f ./TALS_S_Faktorisieren/*.pdf ${BBW_WEBDAV_PATH_FP}/i_tals/thema/glf/aa1/faktorisieren








