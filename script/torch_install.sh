curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
git clone https://github.com/torch/distro.git ~/git/torch --recursive
cd ~/git/torch; ./install.sh
source ~/.bashrc

luarocks install image
luarocks install optim

sudo apt-get install libhdf5-serial-dev hdf5-tools
cd ~/git 
git clone https://github.com/deepmind/torch-hdf5.git
cd torch-hdf5
luarocks make hdf5-0-0.rockspec LIBHDF5_LIBDIR="/usr/lib/x86_64-linux-gnu/"

sudo pip install h5py


luarocks install unsup
