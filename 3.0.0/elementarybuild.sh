#!/bin/sh

cp -R ~/$2/elementary-$2 /media/sda5/Bodhi/e17_debs/$1/elementary-$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/elementary-$1.tar.gz elementary-$1/

cd /media/sda5/Bodhi/e17_debs/$1/elementary-$1
dh_make -e "Eric W. Brown (Feneric)" -f ../elementary-$1.tar.gz
make distclean
cp /media/sda5/Bodhi/bodhibuildscripts/controlfiles/elementary/* debian/
dpkg-buildpackage -rfakeroot -b
sudo dpkg -i ../elementary*.deb

#cp -R ~/$2/elementary-$2 /media/sda5/Bodhi/e17_debs/$1/elementary-dbg_$1
#cd /media/sda5/Bodhi/e17_debs/$1
#tar czvf /media/sda5/Bodhi/e17_debs/$1/elementary-dbg_$1.tar.gz elementary-dbg_$1/

#cd /media/sda5/Bodhi/e17_debs/$1/elementary-dbg_$1
#dh_make -p elementary-dbg_$1 -e "Eric W. Brown (Feneric)" -f ../elementary-dbg_$1.tar.gz
#make distclean
#cp /media/sda5/Bodhi/bodhibuildscripts/controlfiles/elementary-dbg/* debian/
#dpkg-buildpackage -rfakeroot -b
