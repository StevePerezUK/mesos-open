#!/bin/bash

if [ ! -f /opt/ansible/functions.sh ];then
  aws s3 cp s3://mesos-build/ansible/functions.sh /opt/ansible
fi

. /opt/ansible/functions.sh
f_chdir ansible
f_add_key

export SERVERLIST="mesos-1.demo.com mesos-2.demo.com mesos-3.demo.com"
export SLEEP_LOOP=0
while true
do
	sleep 20
	let 'SLEEP_LOOP=SLEEP_LOOP+1'
	if [ $SLEEP_LOOP -eq 6 ];then
		echo "Timed out"
		exit 1
	fi

	PREV_ZID="empty"

	for inst in $SERVERLIST
	do
		ZID=`echo stat|nc $inst 2181|grep Zxid|awk -F: '{print $2}'`
		if [ "$PREV_ZID" == "empty" ];then
			export PREV_ZID=$ZID
			export PREV_HOST=$inst
			continue
		fi
		if [ "$PREV_ZID" == "$ZID" ];then
			echo "$inst matched"
			export PREV_ZID=$ZID
			export PREV_HOST=$inst
			continue
		else
			echo "$inst didn't match"
			echo "$PREV_HOST = $PREV_ZID"
			echo "$inst = $ZID"

			if [ "$(expr $PREV_ZID \> $ZID)" == "1" ];then
				echo "PREV_ZID is greater than CURRENT ZID"
       			echo "Restarting zookeeper on $inst"
        		ssh centos@$inst sudo systemctl restart zookeeper
			else
 				echo "PREV_ZID is less than CURRENT ZID"
 				echo "Restarting zookeeper on $PREV_HOST"
 				ssh centos@$PREV_HOST sudo systemctl restart zookeeper
			fi
			continue 2
		fi
	done
	exit 0
done
