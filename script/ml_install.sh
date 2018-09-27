sudo easy_install pip

## machine learning
sudo apt-get install python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran

# scikit learn
sudo apt-get install build-essential python-dev python-setuptools \
                     libatlas-dev libatlas3gf-base
sudo apt-get install python-numpy python-scipy 
source ~/.bashrc 

sudo update-alternatives --set libblas.so.3 /usr/lib/atlas-base/atlas/libblas.so.3
sudo update-alternatives --set liblapack.so.3 /usr/lib/atlas-base/atlas/liblapack.so.3

sudo -H pip install numpy --upgrade
sudo -H pip install scipy --upgrade

# for amazon cloud?
#sudo -H pip install --user --install-option="--prefix=" -U scikit-learn
sudo -H pip install scikit-learn

#PyMVPA??
sudo apt-get install swig

#PyMVPA
cd ~/git 
git clone https://github.com/PyMVPA/PyMVPA.git
cd PyMVPA
python setup.py build_ext
sudo python setup.py install

source ~/.bashrc 

#cssvm (github code has path bug. Please copy my local one.)
#sudo apt-get install python-libsvm
#cd ~/git 
#git clone https://github.com/airanmehr/cssvm.git
#cd cssvm
#./make
#cd python
#./make

# for star cluster
#sudo apt-get update
#sudo apt-get install libffi-dev g++ libssl-dev
#sudo easy_install starcluster
#sudo pip install dill
