roscd() {
    cd $(ros2 pkg prefix --share $1)
}

rsrc() {
    source ./install/setup.bash
}

# create cpp package
# ros2 pkg create my_package --build-type ament_cmake --dependencies rclcpp std_msgs

# create python package
# ros2 pkg create my_py_pkg --build-type ament_python --dependencies rclpy std_msgs

# build with symlink
# colcon build --symlink-install
