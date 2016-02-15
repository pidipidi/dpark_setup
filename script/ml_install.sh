## machine learning
sudo apt-get install python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran

# scikit learn
sudo apt-get install build-essential python-dev python-setuptools \
                     libatlas-dev libatlas3gf-base
sudo apt-get install python-numpy python-scipy 

sudo update-alternatives --set libblas.so.3 /usr/lib/atlas-base/atlas/libblas.so.3
sudo update-alternatives --set liblapack.so.3 /usr/lib/atlas-base/atlas/liblapack.so.3

sudo pip install numpy --upgrade
sudo pip install scipy --upgrade

sudo pip install --user --install-option="--prefix=" -U scikit-learn

#PyMVPA??
sudo apt-get install swig

#PyMVPA
cd ~/git 
git clone https://github.com/PyMVPA/PyMVPA.git
cd PyMVPA
python setup.py build_ext
sudo python setup.py install

