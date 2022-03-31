#!/bin/sh

set -e

rm -rf /var/run/dbus.pid
#mkdir -p /var/run/dbus

dbus-uuidgen --ensure
#dbus-daemon --system
service dbus start

#avahi-daemon --daemonize --no-chroot
service avahi-daemon start

#su-exec shairport-sync shairport-sync "$@"
node server.js
