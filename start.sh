#!/bin/bash

set -e

service dbus start
service avahi-daemon start

shairport-sync -c ./shairport-sync.conf | node server.js
