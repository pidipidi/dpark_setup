## Sensor
sudo apt-get install ros-indigo-rtt ros-indigo-rtt-ros ros-indigo-rtt-rosclock ros-indigo-force-torque-sensor-controller ros-indigo-controller-manager 
cd ~/catkin_ws/src/
git clone https://github.com/ros-drivers/ati_netft_ros_driver.git
cd ~/catkin_ws/
catkin_make_isolated --only-pkg-with-deps netft_rdt_driver --merge

# python_speech_features for mfcc extraction
cd ~/git 
git clone https://github.com/jameslyons/python_speech_features.git
cd python_speech_features
sudo python setup.py install

#OpenCV
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
cd ~/util/opencv-2.4.11/
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j8
sudo make install 

## kinect2
cd ~/catkin_ws/src/
git clone https://github.com/code-iai/iai_kinect2.git
cd iai_kinect2
rosdep install -r --from-paths .
cd ~/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"

## hark msgs
cd ~/git
wget http://www.hark.jp/src/2.1.0/hark-ros-stacks-indigo_2.1.0.tar.gz
tar -xvzf hark-ros-stacks-indigo_2.1.0.tar.gz
cd hark-ros-stacks-indigo/src
cp -r  hark* ~/catkin_ws/src/
cd ~/catkin_ws
catkin_make_isolated --only-pkg-with-deps hark_msgs --merge



