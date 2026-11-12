
gnome_set-num-workspaces() {
    gsettings set org.gnome.desktop.wm.preferences num-workspaces "$1"
}

gnome_get-num-workspaces() {
    gsettings get org.gnome.desktop.wm.preferences num-workspaces
}
