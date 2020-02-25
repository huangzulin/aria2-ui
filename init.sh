#!/bin/sh

mkdir -p /root/.aria2

cp /aria2/conf/* /root/.aria2/


touch /root/.aria2/aria2.session

# sh /root/.aria2/update-bt-tracker.sh

darkhttpd /aria-ng --port 80 &
darkhttpd /aria2/downloads --port 8080 &
aria2c --conf-path=/root/.aria2/aria2.conf
