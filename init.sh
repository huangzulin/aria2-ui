#!/bin/sh

mkdir -p /root/.aria2

cp /aria2/conf/aria2.conf /root/.aria2/aria2.conf
ls /aria2/conf -a
ls //root/.aria2 -a

if [ $SECRET ]; then
	echo "rpc-secret=${SECRET}" >> /root/.aria2/aria2.conf
fi
if [ ! -f /aria2/conf/delete.aria2.sh ]; then
	cp /aria2/conf/delete.aria2.sh /root/.aria2/delete.aria2.sh
fi

touch /root/.aria2/aria2.session

# sh /root/.aria2/update-bt-tracker.sh

darkhttpd /aria-ng --port 80 &
darkhttpd /aria2/downloads --port 8080 &
aria2c --conf-path=/root/.aria2/aria2.conf
