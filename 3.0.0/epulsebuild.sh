#!/bin/sh

cp -R ~/git/epulse-git /media/sda5/Bodhi/e17_debs/$1/epulse-e19_$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/epulse-e19_$1.tar.gz epulse-e19_$1/

cd /media/sda5/Bodhi/e17_debs/$1/epulse-e19_$1
make distclean
dh_make -p epulse-e19_$1 -e "Eric W. Brown (Feneric)" -f ../epulse-e19_$1.tar.gz

cp /media/sda5/Bodhi/bodhibuildscripts/controlfiles/epulse-e19/control debian/
dpkg-buildpackage -rfakeroot
sudo dpkg -i ../epulse-e19*.deb
