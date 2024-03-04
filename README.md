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
# Setup with Docker and VS Code

Install Docker, VS Code, and the Dev Containers extension in VS Code. The repository contains a Dockerfile and devcontainer.json in the .devcontainer folder. When opening the folder with VS Code, it should ask you whether you want to reopen the folder in a container. If not, you can press F1 and search for "Dev Containers: Rebuild and Reopen in Container". After the container is open, run "docker_setup_workspace.sh" to initialize and build the workspaces. Subsequently, you can simply run "catkin build". Run "source devel_release/setup.bash" to source the workspace.

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