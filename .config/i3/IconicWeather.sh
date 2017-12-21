#!/bin/bash 

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
 
if [ -z $1 ]; then
echo
echo "USAGE: weather.sh <locationcode>"
echo
exit 0;
fi
 
curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -n ~/.config/i3/parseWeather
