#!/bin/sh

mkdir -p /root/.aria2

cp /aria2/conf/* /root/.aria2/


if [ $SECRET ]; then
    echo "rpc-secret=${SECRET}" >> /root/.aria2/aria2.conf
fi

touch /root/.aria2/aria2.session

sh /root/.aria2/update-bt-tracker.sh

darkhttpd /ariang --port 80 &
darkhttpd /aria2/downloads --port 81 &
aria2c --conf-path=/root/.aria2/aria2.conf
