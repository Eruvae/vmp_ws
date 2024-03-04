#!/bin/bash
pushd voxblox_ws
catkin config --profile release -x _release --extend /opt/ros/noetic --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin config --profile debug -x _debug --extend /opt/ros/noetic --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin profile set release
catkin build
popd
catkin config --profile release -x _release --extend voxblox_ws/devel_release --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin config --profile debug -x _debug --extend voxblox_ws/devel_release --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin profile set release
catkin build