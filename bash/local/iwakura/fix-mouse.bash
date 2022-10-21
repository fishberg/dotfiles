fix-mouse(){
    sudo modprobe -r psmouse
    sudo modprobe psmouse
}
