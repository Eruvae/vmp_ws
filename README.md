# Usage

Clone the repository with submodules:
```
git clone --recursive https://github.com/Eruvae/vmp_ws.git
```

Run the setup script to configure the workspace:
```
cd vmp_ws
./setup_workspace.sh
```

Build the workspace:
```
catkin build
```

Source the workspace:
```
source devel_release/setup.bash
```

# Run view motion planner (example)

Launch simulation:
```
roslaunch ur_with_cam_gazebo ur_with_cam.launch base:=trolley world_name:=world23
```

Run view motion planner:
```
rosrun view_motion_planner planner_node
```

Launch rviz:
```
roslaunch ur_with_cam_gazebo rviz.launch
```

Run rqt:
```
rqt
```

Select the ROI Viewpoint Planner plugin: Plugins -> Configuration -> ROI Viewpoint Planner

It should automatically switch to the view motion planner tab.

To run the complete pipeline, change "mode" to "PLAN_WITH_TROLLEY".