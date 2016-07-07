sudo apt-get install screen subversion chromium-browser ssh terminator
sudo apt-get install emacs meld cifs-utils vpnc nfs-common
sudo easy_install pip

mkdir ~/util
cd ~/util
wget https://launchpad.net/python-mode/trunk/6.2.0/+download/python-mode.el-6.2.0.tar.gz
tar -xvzf ./python-mode.el-6.2.0.tar.gz 

# git 
git config --global user.email "deric.park@gatech.edu"
git config --global user.name "pidipidi"

# vpn
cd /etc/
sudo chmod +rx vpnc 
