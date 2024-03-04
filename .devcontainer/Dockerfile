FROM osrf/ros:noetic-desktop-full
ARG USERNAME=USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget rsync git libtool libtool-bin libc++1 python-is-python3 python3-catkin-tools ros-noetic-moveit libceres-dev \
    ros-noetic-tf2-sensor-msgs ros-noetic-octomap-ros ros-noetic-warehouse-ros-mongo ros-noetic-trac-ik-kinematics-plugin \
    ros-noetic-effort-controllers ros-noetic-joint-trajectory-controller ros-noetic-sensor-filters \
    ros-noetic-robot-body-filter ros-noetic-octomap-rviz-plugins ros-noetic-moveit-visual-tools
RUN filename=open3d-devel-linux-x86_64-cxx11-abi-cuda-0.17.0 \
    && wget -nc https://github.com/isl-org/Open3D/releases/download/v0.17.0/$filename.tar.xz \
    && tar -xvf $filename.tar.xz \
    && rsync -rvP $filename/* /usr/local \
    && rm -r $filename \
    && rm $filename.tar.xz

ENV SHELL /bin/bash

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/$USERNAME/.bashrc

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
CMD ["/bin/bash"]
