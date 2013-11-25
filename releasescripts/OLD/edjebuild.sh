#!/bin/sh

cd /home/jeff/$2/edje-$2 && make distclean
./autogen.sh
cp -R /home/jeff/$2/edje-$2 /media/sda5/Bodhi/e17_debs/$1/edje-$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/edje-$1.tar.gz edje-$1/

cd /media/sda5/Bodhi/e17_debs/$1/edje-$1
make distclean
dh_make -e jeffhoogland@linux.com -f ../edje-$1.tar.gz

cp /media/sda5/Bodhi/e17_debs/controlfiles/edje/control debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../edje*.deb
