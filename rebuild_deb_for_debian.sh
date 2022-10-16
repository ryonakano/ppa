#!/bin/sh
#
# A script to fixes the following error message on installation of .deb files made by debuild:
#     dpkg-deb: error: archive ‘foobar_x.x.x-x_all.deb’ uses unknown compression for member ‘control.tar.zst’, giving up
#
# Modification of https://www.dolibarr.org/forum/t/unable-to-install-dolibarr-15-0-2-4-all-deb-on-debian-11-bullseye/22355/2
set -eu

DEB_FILE=base-files_12.3_amd64.deb

# prerequirements
sudo apt install -y binutils
cd debian

# extract .deb
ar x ${DEB_FILE}

# convert compression method
unzstd control.tar.zst
unzstd data.tar.zst
xz control.tar
xz data.tar

# remove old .deb
rm ${DEB_FILE}
# Rebuild .deb
ar cr ${DEB_FILE} debian-binary control.tar.xz data.tar.xz

# clean
rm control.tar.* data.tar.* debian-binary
