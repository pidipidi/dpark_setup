#sudo apt-get install meld
sudo apt-get install ros-indigo-urdfdom-py ros-indigo-ar-track-alvar ros-indigo-pr2-msgs ros-indigo-pr2-controllers-msgs

## git (After adding key)
#cd ~/git
cd ~/catkin_ws/src/
git clone git@git.hsi.gatech.edu:hrl-haptic-manip-dev
git clone https://github.com/gt-ros-pkg/hrl-assistive.git
git clone https://github.com/gt-ros-pkg/hrl-lib.git
git clone https://github.com/gt-ros-pkg/hrl-kdl.git
git clone https://github.com/gt-ros-pkg/hrl-sensor-utils.git
git clone https://github.com/gt-ros-pkg/hrl_autobed_dev.git

cd ~/catkin_ws/src/hrl-haptic-manip-dev/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-lib/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-sensor-utils/
git checkout hydro-devel
cd ~/catkin_ws/src/hrl-assistive/
git checkout indigo-devel

# compile
cd ~/catkin_ws/
catkin_make_isolated --only-pkg-with-deps hrl_kdl --merge
catkin_make_isolated --only-pkg-with-deps hrl_haptic_mpc --merge
catkin_make_isolated --only-pkg-with-deps sandbox_dpark_darpa_m3 --merge
catkin_make_isolated --only-pkg-with-deps hrl_anomaly_detection --merge




## svn
#mkdir -p ~/svn/robot1/src/projects/anomaly
#cd ~/svn/robot1/src/projects
#svn co https://svn.hsi.gatech.edu/cckemp/robot1/src/projects/anomaly ./anomaly

# (Option)
#mkdir ~/svn/hrl_publish
#svn co https://svn.hsi.gatech.edu/cckemp/hrl_publish ~/svn/hrl_publish

#mkdir ~/svn/hrl_presents
#svn co https://svn.hsi.gatech.edu/cckemp/hrl_presents ~/svn/hrl_presents

#mkdir ~/svn/hrl_web
#svn co https://svn.hsi.gatech.edu/cckemp/hrl_web ~/svn/hrl_web



