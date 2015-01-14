#!/bin/sh

mkdir -p ../../bodhi_debs/$1

cp -R ~/$2/efl-$2 ../../bodhi_debs/$1/efl-$1
cd ../../bodhi_debs/$1
tar czvf ../../bodhi_debs/$1/efl-$1.tar.gz efl-$1/

cd ../../bodhi_debs/$1/efl-$1
dh_make -e "Eric W. Brown (Feneric)" -f ../efl-$1.tar.gz
make distclean
cp ../controlfiles/efl/* debian/
dpkg-buildpackage -rfakeroot -b
sudo dpkg -i ../efl*.deb

#cp -R ~/$2/efl-$2 ../../bodhi_debs/$1/efl-dbg_$1
#cd ../../bodhi_debs/$1
#tar czvf ../../bodhi_debs/$1/efl-dbg_$1.tar.gz efl-dbg_$1/

#cd ../../bodhi_debs/$1/efl-dbg_$1
#dh_make -p efl-dbg_$1 -e "Eric W. Brown (Feneric)" -f ../efl-dbg_$1.tar.gz
#make distclean
#cp ../controlfiles/efl-dbg/* debian/
#dpkg-buildpackage -rfakeroot -b
