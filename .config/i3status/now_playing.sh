#!/bin/bash

i3status | while :
do
    export TITLE=$(playerctl metadata title --player=spotify)
    export ARTIST=$(playerctl metadata artist --player=spotify)
    echo "$(date +"%d-%b-%Y %I:%M %p") | Now Playing: $TITLE, $ARTIST"    
done
