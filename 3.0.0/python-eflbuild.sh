#!/bin/sh

mkdir -p ../../bodhi_debs/$1

cp -R ~/$2/python-efl-$2 ../../bodhi_debs/$1/python-efl_$1
cd ../../bodhi_debs/$1
tar czvf ../../bodhi_debs/$1/python-efl_$1.tar.gz python-efl_$1/

cd ../../bodhi_debs/$1/python-efl_$1
dh_make -p python-efl_$1 -e "Eric W. Brown (Feneric)" -f ../python-efl_$1.tar.gz

cp ../controlfiles/python-efl/* debian/
dpkg-buildpackage -rfakeroot -b
sudo dpkg -i ../python-efl*.deb
