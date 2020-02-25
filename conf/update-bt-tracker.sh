#!/bin/sh

# get url_list
tracker_url='https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt'

if [ $TRACKER_URL"x" != "x" ]
then
    tracker_url=$TRACKER_URL
fi

list=$(curl -s $tracker_url)
url_list=$(echo $list | sed 's/[ ][ ]*/,/g')
echo $url_list

sed -i 's#bt-tracker.*#${url_list}#' /root/.aria2/aria2.conf