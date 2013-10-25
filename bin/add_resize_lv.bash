#!/bin/bash

VOL=`vgdisplay | grep "VG Name" | awk '{print $3}'`

pvcreate /dev/vdb
vgextend $VOL /dev/vdb
FREE=`vgdisplay | grep "Free" | awk '{print $7}'`
lvextend -L+`echo $FREE`G /dev/$VOL/lv_root
fsadm resize /dev/$VOL/lv_root

