#!/bin/sh

mountpoint /sata
if [ $? -ne 0 ] ; then
    exit 1
fi

PKGNAME=jellyfin
INSTALLDIR=/sata/app

rm -rf ${INSTALLDIR}/${PKGNAME}

mkdir -p ${INSTALLDIR}/${PKGNAME}
tar xf my.tgz -C ${INSTALLDIR}/${PKGNAME}
chown -R root.root ${INSTALLDIR}/${PKGNAME}

exit 0
