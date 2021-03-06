sudo apt-get install python-openopt python-pyaudio

## git (After adding key)
#cd ~/git
cd ~/catkin_ws/src/
git clone https://github.gatech.edu/hrl/hrl-haptic-manip-dev.git
git clone https://github.com/gt-ros-pkg/hrl-assistive.git
git clone https://github.com/gt-ros-pkg/hrl-lib.git
git clone https://github.com/gt-ros-pkg/hrl-kdl.git
git clone https://github.com/gt-ros-pkg/hrl-sensor-utils.git
git clone https://github.com/gt-ros-pkg/hrl_autobed_dev.git
git clone https://github.com/gt-ros-pkg/hrl.git
git clone https://github.com/gt-ros-pkg/hrl-pr2-behaviors.git

cd ~/catkin_ws/src/hrl-haptic-manip-dev/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-lib/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-sensor-utils/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-assistive/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-kdl/
git checkout dpark_test
cd ~/catkin_ws/src/hrl-pr2-behaviors/
git checkout indigo-devel


# compile
cd ~/catkin_ws/
catkin_init_workspace
catkin_make_isolated --only-pkg-with-deps hrl_srvs --merge
catkin_make_isolated --only-pkg-with-deps hrl_kdl --merge
catkin_make_isolated --only-pkg-with-deps hrl_haptic_mpc --merge
catkin_make_isolated --only-pkg-with-deps sandbox_dpark_darpa_m3 --merge
catkin_make_isolated --only-pkg-with-deps hrl_anomaly_detection --merge
catkin_make_isolated --only-pkg-with-deps equilibrium_point_control --merge
catkin_make_isolated --only-pkg-with-deps hrl_realsense_camera --merge



