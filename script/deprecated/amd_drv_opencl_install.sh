# see
# http://wiki.cchtml.com/index.php/Ubuntu_Trusty_Installation_Guide#Installing_Proprietary_Drivers_a.k.a._Catalyst.2Ffglrx
# https://help.ubuntu.com/community/BinaryDriverHowto/AMD
# http://support.amd.com/en-us/download/desktop?os=Linux+x86

sudo apt-get remove fglrx*
sudo apt-get install cdbs dh-make dkms execstack dh-modaliases linux-headers-generic libqtgui4 xserver-xorg-dev-lts-trusty

sudo apt-get install lib32gcc1

cd ~/util
unzip amd-catalyst-15.9-linux-installer-15.201.1151-x86.x86_64.zip
sudo chmod +x AMD-Catalyst-15.9-Linux-installer-15.201.1151-x86.x86_64.run
sudo ./AMD-Catalyst-15.9-Linux-installer-15.201.1151-x86.x86_64.run --buildpkg Ubuntu/trusty 
sudo dpkg -i fglrx*.deb
sudo amdconfig --initial
# reboot

