#!/system/bin/sh
getevent -s /dev/input/event > /sdcard/list.out
line=`cat /sdcard/list.out|grep -n "Headset"|awk -F ':' '{print $1}'`
#echo $line
let headset_line=line-1
#echo $headset_line
headset_event=`head -$headset_line /sdcard/list.out|tail -1|awk -F 'event' '{print $2}'`
#echo $headset_event
getevent -s $headset_event /dev/input/event$headset_event
rm /sdcard/list.out