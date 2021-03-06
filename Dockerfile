# Base image
FROM duckietown/rpi-ros-kinetic-base:master18

# configure STANDALONE mode
ENV STANDALONE 0

# enable ARM
RUN [ "cross-build-start" ]

# build blockly_backend
RUN mkdir -p /home/software/catkin_ws/src
RUN git clone --depth 1 https://github.com/ripl-ttic/ros_blockly_backend /home/software/catkin_ws/src/blockly_backend
RUN . /opt/ros/$ROS_DISTRO/setup.sh; catkin_make -j2 -C /home/software/catkin_ws

# copy assets
COPY assets/* /root/
RUN chmod +x /root/entrypoint_backend.sh

# disable ARM
RUN [ "cross-build-end" ]

# configure entrypoint
ENTRYPOINT ["/ros_entrypoint.sh", "/root/entrypoint_backend.sh"]
