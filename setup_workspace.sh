#!/bin/bash
pushd voxblox_ws
./setup_workspace.sh
catkin build
popd
catkin config --profile release -x _release --extend voxblox_ws/devel_release --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin config --profile debug -x _debug --extend voxblox_ws/devel_release --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
catkin profile set release
rosdep install --from-paths src --ignore-src --rosdistro noetic -r -y
sudo apt install libceres-dev -y
pushd src/rvp_evaluation
./install_open3d.sh
popd