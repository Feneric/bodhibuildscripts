#!/bin/sh

cd /home/jeff/e17_src/shotgun && make distclean
./autogen.sh
cp -R /home/jeff/e17_src/shotgun /media/sda5/Bodhi/e17_debs/$1/shotgun-$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/shotgun-$1.tar.gz shotgun-$1/

cd /media/sda5/Bodhi/e17_debs/$1/shotgun-$1
make distclean
dh_make -e jeffhoogland@linux.com -f ../shotgun-$1.tar.gz

cp /media/sda5/Bodhi/e17_debs/controlfiles/shotgun/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../shotgun*.deb
