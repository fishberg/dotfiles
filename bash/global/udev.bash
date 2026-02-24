udev_reload() {
    sudo udevadm control --reload-rules && sudo udevadm trigger
}
