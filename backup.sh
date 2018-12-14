#!/bin/bash

today=`date +%Y%m%d.%H_%M_%S`
echo $today

cd /var/www
echo ${today} >> /mnt/usb/00-backups/00-mgarcia/mg.log
echo ${today} >> /mnt/usb/00-backups/00-mgarcia/mg.log
echo ${today} >> /mnt/usb/00-backups/00-mgarcia/mg.log
echo ${today} >> /mnt/usb/00-backups/00-mgarcia/mg.log
echo ${today} >> /mnt/usb/00-backups/00-mgarcia/mg.log


echo "TARRING NOW" >> /mnt/usb/00-backups/00-mgarcia/mg.log

#from https://help.ubuntu.com/community/BackupYourSystem/TAR
nice -n +15 tar -cvpzf /share/mgarcia_$today.tar.gz --exclude=/var/www/mgarcia/public_html/pen/poi --one-file-system /var/www/mgarcia >> /mnt/usb/00-backups/00-mgarcia/mg.log

echo "TARRING FINISHED" >> /mnt/usb/00-backups/00-mgarcia/mg.log

ls -lh  /share/mgarcia_$today.tar.gz  >> /mnt/usb/00-backups/00-mgarcia/mg.log



ls -l  /mnt/usb/00-backups/00-mgarcia >> /mnt/usb/00-backups/00-mgarcia/mg.log 
 
echo " move current old to backup dir " >> /mnt/usb/00-backups/00-mgarcia/mg.log
cp  -fv /share/mgarcia_$today.tar.gz   /mnt/usb/00-backups/mgarcia.tar.gz  >> /mnt/usb/00-backups/00-mgarcia/mg.log
mv  /share/mgarcia_$today.tar.gz   /mnt/usb/00-backups/00-mgarcia


ls -l  /mnt/usb/00-backups/00-mgarcia >> /mnt/usb/00-backups/00-mgarcia/mg.log 


YEAR=$(date +%Y)
MONTH=$(date +%m)
WEEK=$(date +%W)
echo ${YEAR} >> /mnt/usb/00-backups/00-mgarcia/mg.log
echo ${MONTH} >> /mnt/usb/00-backups/00-mgarcia/mg.log
echo ${WEEK} >> /mnt/usb/00-backups/00-mgarcia/mg.log

mkdir -p /mnt/usb/00-backups/00-mgarcia/${YEAR}
mkdir -p /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH}
mkdir -p /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH}/${WEEK}



ls -l  /mnt/usb/00-backups/00-mgarcia/${YEAR} >> /mnt/usb/00-backups/00-mgarcia/mg.log 
ls -l  /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH} >> /mnt/usb/00-backups/00-mgarcia/mg.log
ls -l /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH}/${WEEK}  >> /mnt/usb/00-backups/00-mgarcia/mg.log




cp -fv /mnt/usb/00-backups/mgarcia.tar.gz /mnt/usb/00-backups/00-mgarcia/${YEAR}  >> /mnt/usb/00-backups/00-mgarcia/mg.log
cp -fv /mnt/usb/00-backups/mgarcia.tar.gz /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH}  >> /mnt/usb/00-backups/00-mgarcia/mg.log
cp -fv /mnt/usb/00-backups/mgarcia.tar.gz /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH}/${WEEK}  >> /mnt/usb/00-backups/00-mgarcia/mg.log



ls -l  /mnt/usb/00-backups/00-mgarcia/${YEAR} >> /mnt/usb/00-backups/00-mgarcia/mg.log 
ls -l  /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH} >> /mnt/usb/00-backups/00-mgarcia/mg.log
ls -l /mnt/usb/00-backups/00-mgarcia/${YEAR}/${MONTH}/${WEEK}  >> /mnt/usb/00-backups/00-mgarcia/mg.log





cd  /mnt/usb/00-backups/00-mgarcia


ls -1t | (i=0; while read f; do
  if [ $i -lt 150 ]; then
    ((i++))
    continue
  else
    echo "$f" >> /mnt/usb/00-backups/00-mgarcia/mg.log
	rm -f "$f"
  fi
done)


echo "Bash FINISHED" >> /mnt/usb/00-backups/00-mgarcia/mg.log

exit 0
#chmod -R 777 /mnt/usb/00*
