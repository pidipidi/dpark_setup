
mkdir ~/util
cd ~/util
wget https://launchpad.net/python-mode/trunk/6.2.0/+download/python-mode.el-6.2.0.tar.gz
tar -xvzf ./python-mode.el-6.2.0.tar.gz 

sudo apt-get install emacs
ln -s ~/git/dpark_setup/util/bashrc_14_04 ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc.hrl.sh ~/.bashrc.hrl.sh
ln -s ~/git/dpark_setup/util/bashrc.gazebo.sh ~/.bashrc.gazebo.sh
ln -s ~/git/dpark_setup/util/emacs ~/.emacs
ln -s ~/git/dpark_setup/util/git-completion.bash ~/git-completion.bash
ln -s ~/git/dpark_setup/util/screenrc ~/.screenrc
cp -r ~/git/dpark_setup/util/emacs.d/* ~/.emacs.d/
source ~/.bashrc 

# ros

# util
sudo apt-get install screen
