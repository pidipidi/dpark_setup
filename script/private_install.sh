sudo apt-get install python-openopt python-pyaudio

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



## Sensor
#sudo apt-get install ros-indigo-rtt ros-indigo-rtt-ros ros-indigo-rtt-rosclock ros-hydro-force-torque-sensor-controller ros-hydro-controller-manager 
#cd ~/catkin_ws/src/
#git clone git clone https://github.com/ros-drivers/ati_netft_ros_driver.git
#catkin_make_isolated --only-pkg-with-deps netft_rdt_driver --merge

