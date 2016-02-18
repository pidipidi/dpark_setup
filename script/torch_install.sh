
sudo apt-get install libhdf5-serial-dev hdf5-tools
cd ~/git 
git clone https://github.com/deepmind/torch-hdf5.git
cd torch-hdf5
luarocks make hdf5-0-0.rockspec LIBHDF5_LIBDIR="/usr/lib/x86_64-linux-gnu/"

sudo pip install h5py


luarocks install unsup
