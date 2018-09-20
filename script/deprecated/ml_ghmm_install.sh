# GHMM
sudo apt-get install libxml2-dev swig python-joblib cython autoconf subversion
mkdir ~/svn
cd ~/svn 
svn checkout svn://svn.code.sf.net/p/ghmm/code/trunk/ghmm ghmm 
cd ghmm
./autogen.sh
./configure
make -j8
sudo make install

#sudo apt-get install automake automake swig
#cd ~/svn/ghmm/
#./autogen.sh
#./configure
#make -j4
#sudo make install
