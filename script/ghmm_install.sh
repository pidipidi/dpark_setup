sudo apt-get install automake automake swig
cd ~/svn/ghmm/
./autogen.sh
./configure
make -j4
sudo make install
