# 0: utility installation
./util_install.sh

# 1: environment files copy
rm ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc_14_04 ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc.hrl.sh ~/.bashrc.hrl.sh
ln -s ~/git/dpark_setup/util/bashrc.gazebo.sh ~/.bashrc.gazebo.sh
ln -s ~/git/dpark_setup/util/bashrc.kinect2.sh ~/.bashrc.kinect2.sh
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
./ghmm_install.sh

# 4: repositories
./private_install.sh

# 5: svn
./svn_install.sh

# 6: torch
