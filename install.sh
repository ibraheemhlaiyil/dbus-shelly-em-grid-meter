#!/bin/bash

# set permissions for script files
chmod a+x /data/dbus-shelly-em-grid-meter/restart.sh
chmod 744 /data/dbus-shelly-em-grid-meter/restart.sh

chmod a+x /data/dbus-shelly-em-grid-meter/uninstall.sh
chmod 744 /data/dbus-shelly-em-grid-meter/uninstall.sh

chmod a+x /data/dbus-shelly-em-grid-meter/service/run
chmod 755 /data/dbus-shelly-em-grid-meter/service/run



# create sym-link to run script in deamon
ln -s /data/dbus-shelly-em-grid-meter/service /service/dbus-shelly-em-grid-meter



# add install-script to rc.local to be ready for firmware update
filename=/data/rc.local
if [ ! -f $filename ]
then
    touch $filename
    chmod 755 $filename
    echo "#!/bin/bash" >> $filename
    echo >> $filename
fi

grep -qxF '/data/dbus-shelly-em-grid-meter/install.sh' $filename || echo '/data/dbus-shelly-em-grid-meter/install.sh' >> $filename
