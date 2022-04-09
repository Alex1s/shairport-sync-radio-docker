#!/bin/bash

set -e

service dbus start
service avahi-daemon start

case $FORMAT in

    MP3)
        ./start_mp3.sh
    ;;

    WAV)
        ./start_wav.sh
    ;;

    *)
        echo "Unknown FORMAT defaulting to MP3"
        ./start_mp3.sh
    ;;

esac
