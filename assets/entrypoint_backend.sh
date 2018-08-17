#!/bin/bash

# source ROS and blockly_backend
source /opt/ros/$ROS_DISTRO/setup.bash
source /home/software/catkin_ws/devel/setup.bash

# launch blockly
if [[ "$STANDALONE" == 1 ]]; then
    roslaunch blockly_backend blockly_backend.launch
else
    roslaunch --wait blockly_backend blockly_backend.launch
fi
