#!/bin/sh

set -e

pack="jellyfin"
ver="10.5.5"

time=$(date +%Y.%m.%d-%H:%M:%S)
pkg=${pack}-${ver}-${time}-x3plus.app

tar zcf my.tgz app bin cmd S100jellyfin
tar cf ${pkg} up.sh my.tgz version
rm -f my.tgz
