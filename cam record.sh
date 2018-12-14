#!/bin/bash

trap "exit" INT
cd /mnt/usb/CAMERAS

while [ 1 ]
do
echo
echo
tt=`date '+%H'`
echo $tt
echo
echo
echo

now=`date '+%Y-%m-%d-%H-%M-%S'`

echo 
echo start $now 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
echo 
echo 

# -v
openRTSP -c -B 10000000 -b 10000000   -V   -t -q rtsp://10.0.0.0:0 > ${now}_front.mov &

echo $now 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000####################

openRTSP -c -B 10000000 -b 10000000   -V   -t -q rtsp://10.0.0.0:0 > ${now}_gate.mov &


echo $now 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000



nohup avconv -f mjpeg -nostats -loglevel 0 -re  -i 'http://10.0.0.0:0/videostream.cgi?user=&pwd=' -an -r 5  -c copy -map 0 -vcodec copy ${now}_back.avi > /dev/null &


echo "$tt"



#if (( "$tt" >= 3  && "$tt" <= 22 ))
if (( 0  ))
then
echo recording MG
nohup avconv -f mjpeg -nostats -loglevel 0 -re  -i 'http://10.0.0.0:0/videostream.cgi?user=&pwd=' -an -r 5  -c copy -map 0 -vcodec copy ${now}_MG.avi >/dev/null &
fi

echo 
echo 

echo sleeping $now 22222222222222222222

#sleep 1m
sleep 60m

killall -s SIGHUP openRTSP; killall -s SIGHUP  avconv
sleep 10
killall -s SIGHUP openRTSP; killall -s SIGHUP  avconv
killall -s SIGHUP openRTSP; killall -s SIGHUP  avconv
killall -9 openRTSP; killall -9  avconv
sleep 10
echo $now ---------------------------------------



dirname=`date '+%Y-%m-%d'`
dirname="/mnt/usb/CAMERAS/CAMS-$dirname";
# mkdir -p ${dirname}
echo  ${dirname}
mkdir -p  ${dirname}

mv 20* ${dirname}




done
echo All done

pkill openRTSP; pkill avconv





