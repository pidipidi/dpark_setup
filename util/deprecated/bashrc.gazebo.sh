export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib/atlas-base/:${LD_LIBRARY_PATH}
export LD_RUN_PATH=/usr/local/lib:/usr/lib/atlas-base/:${LD_RUN_PATH}
export PATH=/usr/local/bin/:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/ros/fuerte/lib/pkgconfig:
#export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/ros/groovy/lib/pkgconfig:

source /usr/local/share/gazebo/setup.sh

export GAZEBO_PLUGIN_PATH=/usr/local/lib/gazebo_plugins:${GAZEBO_PLUGIN_PATH}
export GAZEBO_MODEL_PATH=`rospack find sandbox_dpark_darpa_m3`/gazebo_plugin/models:${GAZEBO_MODEL_PATH}

export PYTHONPATH=$PYTHONPATH:`openrave-config --python-dir`