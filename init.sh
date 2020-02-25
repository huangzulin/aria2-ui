#!/bin/sh
if [ ! -f /aria2/conf/aria2.conf ]; then
	cp /aria2/conf/aria2.conf /root/.aria2/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /root/.aria2/aria2.conf
	fi
fi
if [ ! -f /aria2/conf/delete.aria2.sh ]; then
	cp /aria2/conf/delete.aria2.sh /root/.aria2/delete.aria2.sh
fi

chmod +x /root/.aria2/on-complete.sh
touch /root/.aria2/aria2.session

sh /root/.aria2/update-bt-tracker.sh

darkhttpd /aria-ng --port 80 &
darkhttpd /aria2/downloads --port 8080 &
aria2c --conf-path=/root/.aria2/aria2.conf
