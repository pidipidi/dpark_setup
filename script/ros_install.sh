# ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
source /opt/ros/kinetic/setup.bash
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential


#sudo apt-get install ros-indigo-urdfdom-py ros-indigo-ar-track-alvar ros-indigo-pr2-msgs ros-indigo-pr2-controllers-msgs ros-indigo-pr2-kinematics ros-indigo-sound-play ros-indigo-manipulation-msgs
#source ~/.bashrc 
