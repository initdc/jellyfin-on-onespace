#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin

BINNAME=cloudflared
PKGNAME=cloudflared
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

nohup ${INSTALLDIR}/${PKGNAME}/bin/${BINNAME} tunnel run >/dev/null 2>&1 &
