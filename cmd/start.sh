#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin

BINNAME=jellyfin
PKGNAME=jellyfin
INSTALLDIR=/sata/app
BLOCKDIR=/sata/.storage/appblock

if [ -f ${BLOCKDIR}/${PKGNAME} ]; then
	echo "Start ${PKGNAME} Abort, User Disabled"
	exit
fi

pidof ${BINNAME}
if [ $? -eq 0 ]; then
	exit
fi

if test -f /sata/app/jellyfin/etc/default/jellyfin; then
    . /sata/app/jellyfin/etc/default/jellyfin
fi

JELLYFIN_DATA_DIR="/sata/public/.jellyfin" start-stop-daemon --start --background --exec ${INSTALLDIR}/${PKGNAME}/bin/${BINNAME} -- --ffmpeg=/usr/bin/ffmpeg