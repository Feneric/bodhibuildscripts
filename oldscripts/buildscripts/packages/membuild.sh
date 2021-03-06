#!/bin/sh

cd /home/jeff/e17_src/mem && make distclean
./autogen.sh
cp -R /home/jeff/e17_src/mem /media/sda5/Bodhi/e17_debs/$1/mem-$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/mem-$1.tar.gz mem-$1/

cd /media/sda5/Bodhi/e17_debs/$1/mem-$1
make distclean
dh_make -e jeffhoogland@linux.com -f ../mem-$1.tar.gz

cp /media/sda5/Bodhi/e17_debs/controlfiles/mem/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../mem*.deb
