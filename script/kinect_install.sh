
## OpenNI
sudo apt-get install git-core cmake freeglut3-dev pkg-config build-essential libxmu-dev libxi-dev libusb-1.0-0-dev doxygen graphviz mono-complete
sudo apt-get install openjdk-7-jdk
cd ~/git/ 
git clone https://github.com/OpenNI/OpenNI.git
cd ~/git/OpenNI/Platform/Linux/CreateRedist/
cd ./RedistMarker 
cd ./Final
tar -xjf OpenNI-Bin-Dev-Linux-x64-v1.5.7.10.tar.bz2 
cd OpenNI-Bin-Dev-Linux-x64-v1.5.7.10
sudo ./install.sh


## OpenCV 3.0 will not work!!! Use 2.4.x!! 
# see 
# http://docs.opencv.org/3.0-last-rst/doc/tutorials/introduction/linux_install/linux_install.html
cd ~/util 
unzip opencv-2.4.11.zip

sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

cd ~/util/opencv-2.4.11/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j7
sudo make install

## libfreenect2
cd ~/git 
git clone https://github.com/OpenKinect/libfreenect2.git
sudo apt-get install build-essential libturbojpeg libjpeg-turbo8-dev libtool autoconf libudev-dev cmake mesa-common-dev freeglut3-dev libxrandr-dev doxygen libxi-dev automake
cd libfreenect2/depends
sh install_ubuntu.sh
sudo dpkg -i libglfw3*_3.0.4-1_*.deb
# AMD GPU
sudo apt-get install opencl-headers
#
cd ..
mkdir build && cd build
cmake ../examples/protonect/ -DENABLE_CXX11=ON
make && sudo make install

## kinect2
cd ~/catkin_ws/src/
git clone https://github.com/code-iai/iai_kinect2.git
cd iai_kinect2
rosdep install -r --from-paths .
cd ~/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE="Release"

