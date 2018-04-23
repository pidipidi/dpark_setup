# 0: utility installation
sudo apt-get install screen subversion
sudo apt-get install emacs
sudo easy_install pip

mkdir ~/util
cd ~/util
wget https://launchpad.net/python-mode/trunk/6.2.0/+download/python-mode.el-6.2.0.tar.gz
tar -xvzf ./python-mode.el-6.2.0.tar.gz 


# 1: environment files copy
rm ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc_14_04 ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc.hrl.sh ~/.bashrc.hrl.sh
ln -s ~/git/dpark_setup/util/bashrc.hark.sh ~/.bashrc.hark.sh
ln -s ~/git/dpark_setup/util/emacs ~/.emacs
ln -s ~/git/dpark_setup/util/git-completion.bash ~/git-completion.bash
ln -s ~/git/dpark_setup/util/screenrc ~/.screenrc
cp -r ~/git/dpark_setup/util/emacs.d/* ~/.emacs.d/
source ~/.bashrc 

# 2: ros
./ros_install.sh

# 3: ml
./ml_install.sh
./ml_ghmm_install.sh

# 4: repositories
./ros_git_install.sh
