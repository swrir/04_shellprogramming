#!/bin/bash

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2

# 1. PV
# 2. VG
# 3. LV

############################
# 1. PV
############################
# (1) View
fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2

cat << EOF
############# PV VIEW #############
$(cat $TMP1 $TMP2 | sort | uniq -u)
###################################

EOF

# (2) Works
echo "=> 위의 목록에서 PV로 생성하고 싶은 볼륨을 선택합니다. <="
echo -n "볼륨 선택? (ex: /dev/sdb1 /dev/sdc1 ...) : "
read VOLUME

pvcreate $VOLUME >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[  OK  ] Physical volume $VOLUME successfully created."
    pvs
else
    echo "[ FAIL ] Physical volume not created."
    exit 1 
fi
############# PV VIEW #############
$(cat $TMP1 $TMP2 | sort | uniq -u)
###################################
############################
# 2. VG
############################
# (1) View
# (2) Works
############################
# 3. LV
############################
# (1) View
# (2) Works