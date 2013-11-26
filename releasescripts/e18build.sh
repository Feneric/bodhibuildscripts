#!/bin/sh

#cd /home/jeff/$2/e18-$2 && make clean
#./configure
cp -R /home/jeff/$2/enlightenment-$2 /media/sda5/Bodhi/e17_debs/$1/e18-$1

cd /media/sda5/Bodhi/e17_debs/$1/e18-$1
cp -a /media/sda5/Bodhi/patches/e18/wizard/*.patch .

patch -p1 < 0001-Fix-wizard-makefile.patch
patch -p1 < 0002-Update-bodhi-wizard-code-to-build-again.patch

cp /media/sda5/Bodhi/patches/e18/wizard/page_025.c /media/sda5/Bodhi/e17_debs/$1/e18-$1/src/modules/wizard/

cp /media/sda5/Bodhi/patches/e18/illume-keyboard/* /media/sda5/Bodhi/e17_debs/$1/e18-$1/src/modules/illume-keyboard/keyboards/

cd /media/sda5/Bodhi/e17_debs/$1/e18-$1/src/bin
patch < /media/sda5/Bodhi/patches/e18/e/bodhi_menu.diff
patch < /media/sda5/Bodhi/patches/e18/e/module-patch.diff
#patch -p0 < /media/sda5/Bodhi/patches/e18/e/e_config.c.patch

cd /media/sda5/Bodhi/e17_debs/$1
tar czvf e18-$1.tar.gz e18-$1/


cd /media/sda5/Bodhi/e17_debs/$1/e18-$1
make distclean
dh_make -e jeffhoogland@linux.com -f ../e18-$1.tar.gz

cp -f /media/sda5/Bodhi/e17_debs/controlfiles/e18/* debian/
dpkg-buildpackage -rfakeroot -b
dpkg -i ../e18*.deb