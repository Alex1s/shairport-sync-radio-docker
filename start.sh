#!/bin/bash

set -e

service dbus start
service avahi-daemon start

node server.js "$@"
