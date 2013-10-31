#!/bin/sh
#copylefted by Harvie 2o12

get_playlist() {
        wget "$1" -O - | grep -o 'http://[^"]*' | while read line; do
                echo $(wget "$line" -O - | grep -o 'http://.*$' | grep '[a-zA-Z0-9]$' | head -n 1)?${line##*/}
        done
}

get_playlist http://listen.di.fm/public3 > ~/di.fm.m3u
get_playlist http://listen.sky.fm/public3 > ~/sky.fm.m3u
