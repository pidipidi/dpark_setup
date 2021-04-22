# 0: utility installation
./util_install.sh

# 1: environment files copy
rm ~/.bashrc
ln -s ~/git/private/dpark_setup/util/bashrc ~/.bashrc
ln -s ~/git/private/dpark_setup/util/emacs ~/.emacs
ln -s ~/git/private/dpark_setup/util/git-completion.bash ~/git-completion.bash
ln -s ~/git/private/dpark_setup/util/screenrc ~/.screenrc
cp -r ~/git/private/dpark_setup/util/emacs.d ~/.emacs.d
source ~/.bashrc 

# 2: ros
#./ros_install.sh

# 3: ml
./ml_install.sh
#./ml_ghmm_install.sh

# 4: repositories
#./ros_git_install.sh
#./svn_install.sh


