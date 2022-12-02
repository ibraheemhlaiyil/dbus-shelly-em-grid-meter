#!/bin/bash

rm /service/dbus-shelly-em-grid-meter
kill $(pgrep -f 'supervise dbus-shelly-em-grid-meter')
chmod a-x /data/dbus-shelly-em-grid-meter/service/run
./restart.sh
