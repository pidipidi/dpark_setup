sudo apt-get install screen subversion ssh terminator
sudo apt-get install emacs meld cifs-utils
sudo easy_install pip

mkdir ~/util
cd ~/util
wget https://launchpad.net/python-mode/trunk/6.2.3/+download/python-mode.el-6.2.3.tar.gz
tar -xvzf ./python-mode.el-6.2.3.tar.gz 

# git 
git config --global user.email "pidipidi52@gmail.com"
git config --global user.name "pidipidi"
git config -l

# git token by 220815
# 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

#pdf
sudo apt-get install zenity ghostscript
cd ~/.gnome2/nautilus-scripts/
wget https://launchpad.net/compress-pdf/1.x/1.5/+download/Compress-PDF-1.5.tar.gz
tar zvxf Compress-PDF-1.5.tar.gz
