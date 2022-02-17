#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

ACTION=$(basename $0)

PKGNAME=jellyfin
BINNAME=jellyfin
INSTALLDIR=/sata/app
BLOCKDIR=/sata/.storage/appblock

if [ $ACTION = "del.sh" ]; then

	${INSTALLDIR}/${PKGNAME}/cmd/stop.sh
	rm -rf ${INSTALLDIR}/${PKGNAME}
	rm -f ${BLOCKDIR}/${PKGNAME}

elif [ $ACTION = "on.sh" ]; then

	rm -f ${BLOCKDIR}/${PKGNAME}
	${INSTALLDIR}/${PKGNAME}/cmd/start.sh

elif [ $ACTION = "off.sh" ]; then

	${INSTALLDIR}/${PKGNAME}/cmd/stop.sh

	if [ $# -eq 0 ]; then
		touch ${BLOCKDIR}/${PKGNAME}
	fi

elif [ $ACTION = "stat.sh" ]; then

	pidof ${BINNAME} >/dev/null

	if [ $? -ne 0 ]; then
		echo -n "off"
	else
		echo -n "on"
	fi

fi
