export HRLBASEPATH=/home/dpark/svn/robot1

export ROS_PACKAGE_PATH=/opt/ros/fuerte/share:/opt/ros/fuerte/stacks:/home/dpark/svn/robot1/src:/home/dpark/svn
#export ROS_PACKAGE_PATH=/opt/ros/groovy/share:/opt/ros/groovy/stacks
export OPENRAVE_DATA=/urdf
export ROS_WORKSPACE=/home/dpark/git/

# For M3
#export OPENRAVE_DATA=`rospack find cody`/urdf 
#umask 002 
#export ROS_PACKAGE_PATH=/home/dpark/svn/mekabot/m3_ros:$ROS_PACKAGE_PATH
#export ROS_PACKAGE_PATH=/home/dpark/svn/mekabot/m3skin/trunk/ros:$ROS_PACKAGE_PATH 
#export ROS_PACKAGE_PATH=/home/dpark/svn/mekabot/meka-ros-pkg:$ROS_PACKAGE_PATH

# Personal Path
export ROS_PACKAGE_PATH=/home/dpark/git/hrl-haptic-manip-dev/:/home/dpark/git:$ROS_PACKAGE_PATH
#export ROS_PACKAGE_PATH=/home/dpark/workspace:$ROS_PACKAGE_PATH
export PYTHONPATH=/usr/local/lib/python2.7/dist-packages:$PYTHONPATH

#export ROS_PACKAGE_PATH=/home/dpark/code/modeling_forces:/home/dpark/code/icra_epc_pull:$ROS_PACKAGE_PATH


# added for external library
#export LD_LIBRARY_PATH=/usr/local/openblas-base:${LD_LIBRARY_PATH}
