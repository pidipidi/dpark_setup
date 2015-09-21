
mkdir ~/util
cd ~/util
wget https://launchpad.net/python-mode/trunk/6.2.0/+download/python-mode.el-6.2.0.tar.gz
tar -xvzf ./python-mode.el-6.2.0.tar.gz 

sudo apt-get install emacs
rm ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc_14_04 ~/.bashrc
ln -s ~/git/dpark_setup/util/bashrc.hrl.sh ~/.bashrc.hrl.sh
ln -s ~/git/dpark_setup/util/bashrc.gazebo.sh ~/.bashrc.gazebo.sh
ln -s ~/git/dpark_setup/util/bashrc.kinect2.sh ~/.bashrc.kinect2.sh
ln -s ~/git/dpark_setup/util/emacs ~/.emacs
ln -s ~/git/dpark_setup/util/git-completion.bash ~/git-completion.bash
ln -s ~/git/dpark_setup/util/screenrc ~/.screenrc
cp -r ~/git/dpark_setup/util/emacs.d/* ~/.emacs.d/
source ~/.bashrc 

# ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full
sudo rosdep init
rosdep update
#echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall

# catkin ws
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make
source ~/.bashrc

# kinect

# util
sudo apt-get install screen

# git 
git config --global user.email "deric.park@gatech.edu"
git config --global user.name "pidipidi"
