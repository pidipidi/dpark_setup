
cd ~/
mkdir hark

sudo apt-get install libtool libgnomeui-dev libxml++2.6-dev libxml2-dev libasound2-dev libboost-dev libboost-regex-dev libboost-thread-dev libboost-program-options-dev libboost-filesystem-dev libsndfile1-dev

wget http://www.hark.jp/src/2.1.0/flowdesigner-0.9.1-hark_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/libhark-netapi_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/harkfd_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/julius-4.2.3-hark-plugin_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/julius-4.2.3-hark_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/harktool4-cui_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/harktool4_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/hark-designer_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/libharkio3_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/hark-ros-indigo_2.1.0.tar.gz
wget http://www.hark.jp/src/2.1.0/hark-ros-stacks-indigo_2.1.0.tar.gz


sudo apt-get install fftw-dev
sudo apt-get install libharkio*
sudo apt-get install hark-music
sudo apt-get install hark-python
sudo apt-get install hark-binaural
sudo apt-get install hark-kinect
sudo apt-get install hark-opencv
sudo apt-get install harktool4
sudo apt-get install harktool4-cui
sudo apt-get install julius-4.2.3-hark-plugin
sudo apt-get install librasp-netapi
sudo apt-get install harkfd-dev

# flowdesigner (local)
#cd ~/hark 
#tar -xvzf flowdesigner-0.9.1-hark_2.1.0.tar.gz
#cd ~/hark/flowdesigner-0.9.1-hark
#./configure
#make -j8
#sudo make install

# harkfd
#cd ~/hark 
#tar -xvzf harkfd_2.1.0.tar.gz
#sudo apt-get install libasound2-dev libboost-thread-dev
#cd hark-fd
#./configure --prefix=/usr/local --enable-harknetapi --with-harknetapi-inc=/usr/include --with-harknetapi-lib=/usr/lib
#make -j8
#sudo make install

# hark designer
cd ~/hark 
tar -xvzf hark-designer_2.1.0.tar.gz 
cd hark-designer/
sudo apt-get install qtcreator 
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

sudo apt-get install ruby-compass
sudo gem install compass
npm install
sudo npm install grunt-contrib-compass --save-dev
sudo npm install -g grunt-cli
grunt

# harkio 3 (local)
#cd ~/hark 
#tar -xvzf libharkio3_2.1.0.tar.gz
#cd libharkio3/
#sudo apt-get install g++ libboost-dev libxml++2.6-dev libboost-regex-dev
#sudo sh bootstrap.sh
#mkdir build
#cd build
#cmake -DCMAKE_BUILD_TYPE=Production ..
#make 
#sudo make install

# harktool4
#cd ~/hark 
#tar -xvzf harktool4_2.1.0.tar.gz
#cd harktool4-gui
#sudo apt-get install qt4-qmake libqt4-dev tidy
#qmake -qt4 harktool4.pro
#make -j8
#sudo make install 

#cd ~/hark 
#tar -xvzf harktool4-cui_2.1.0.tar.gz 
#cd harktool4/
#sudo apt-get install libboost-program-options-dev libboost-filesystem-dev libsndfile1-dev
#sudo apt-get install libglib2.0-dev
#CXXFLAGS=-std=c++0x ./configure
#make -j8
#sudo make isntall

# julius
#cd ~/hark 
#tar -xvzf julius-4.2.3-hark_2.1.0.tar.gz 
#tar -xvzf julius-4.2.3-hark-plugin_2.1.0.tar.gz 
#cd julius-4.2.3-hark
#./configure --prefix=/usr/local --enable-mfcnet
#make -j8
#sudo make install

#cd ..
#cd julius-4.2.3-hark-plugin/
#make -j8
#sudo make install

# hark netapi (it looks not used any more....??)
#cd ~/hark 
#tar -xvzf libhark-netapi_2.1.0.tar.gz 
#cd libharknetapi/
#make
#make static
#sudo make install


# hark ros stack
# copy packages and catkin_make
##sudo apt-get install hark-ros-stacks-indigo 
cd ~/hark 
tar -xvzf hark-ros-stacks-indigo_2.1.0.tar.gz 
cd hark-ros-stacks-indigo/src
cp -r  hark* ~/catkin_ws/src/
cd ~/catkin_ws
catkin_make -DCATKIN_WHITELIST_PACKAGES=fdopencv_msgs,hark_common_msgs,hark_msgs,hark_params,hark_dynamic_reconfigure,harkviz,julius_ros
catkin_make install


# hark ros indigo
cd ~/hark 
tar -xvzf hark-ros-indigo_2.1.0.tar.gz
cd hark-ros-indigo
./configure --enable-ros --with-hark-inc=/usr/include/hark/
make -j8
sudo make install

#sudo apt-get install hark-ros-indigo

