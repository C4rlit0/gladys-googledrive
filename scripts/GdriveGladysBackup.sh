#!/bin/bash
echo '// SAUVEGARDE //'
echo 'Création de la sauvegarde de la base de données'
var_BKP_FILE_NAME=gladys-$(date +%Y-%m-%d-%H-%M).sql
mysqldump -uroot -proot gladys > /home/pi/gladys/api/hooks/googledrive/"$var_BKP_FILE_NAME"
echo 'Sauvegarde créée'
echo 'Upload vers Google Drive'
cd /home/pi/gladys/api/hooks/googledrive/
var_GLDS_BKP_FLD_ID=$(cat GLDS_BKP_FLD_ID.txt)
./gdrive upload --parent "$var_GLDS_BKP_FLD_ID" "$var_BKP_FILE_NAME" --delete
echo 'Sauvegarde terminée !'