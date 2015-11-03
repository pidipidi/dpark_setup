sudo apt-get install meld cifs-utils vpnc 
sudo easy_install pip

sudo apt-get install ros-indigo-urdfdom-py ros-indigo-ar-track-alvar ros-indigo-pr2-msgs ros-indigo-pr2-controllers-msgs ros-indigo-pr2-kinematics python-openopt ros-indigo-sound-play

## git (After adding key)
#cd ~/git
cd ~/catkin_ws/src/
git clone git@git.hsi.gatech.edu:hrl-haptic-manip-dev
git clone https://github.com/gt-ros-pkg/hrl-assistive.git
git clone https://github.com/gt-ros-pkg/hrl-lib.git
git clone https://github.com/gt-ros-pkg/hrl-kdl.git
git clone https://github.com/gt-ros-pkg/hrl-sensor-utils.git
git clone https://github.com/gt-ros-pkg/hrl_autobed_dev.git
git clone https://github.com/gt-ros-pkg/hrl.git

cd ~/catkin_ws/src/hrl-haptic-manip-dev/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-lib/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-sensor-utils/
git checkout hydro-devel
cd ~/catkin_ws/src/hrl-assistive/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl/
git checkout hydro-devel

# compile
cd ~/catkin_ws/
catkin_make_isolated --only-pkg-with-deps hrl_kdl --merge
catkin_make_isolated --only-pkg-with-deps hrl_haptic_mpc --merge
catkin_make_isolated --only-pkg-with-deps sandbox_dpark_darpa_m3 --merge
catkin_make_isolated --only-pkg-with-deps hrl_anomaly_detection --merge
catkin_make_isolated --only-pkg-with-deps equilibrium_point_control --merge

## machine learning
# Scipy
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
# scikit learn
sudo apt-get install build-essential python-dev python-setuptools \
                     python-numpy python-scipy \
                     libatlas-dev libatlas3gf-base
sudo update-alternatives --set libblas.so.3 \
    /usr/lib/atlas-base/atlas/libblas.so.3
sudo update-alternatives --set liblapack.so.3 \
    /usr/lib/atlas-base/atlas/liblapack.so.3
sudo pip install --user --install-option="--prefix=" -U scikit-learn

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

## Sensor
sudo apt-get install ros-indigo-rtt ros-indigo-rtt-ros ros-indigo-rtt-rosclock ros-hydro-force-torque-sensor-controller ros-hydro-controller-manager 
cd ~/catkin_ws/src/
git clone git clone https://github.com/ros-drivers/ati_netft_ros_driver.git
catkin_make_isolated --only-pkg-with-deps netft_rdt_driver --merge

