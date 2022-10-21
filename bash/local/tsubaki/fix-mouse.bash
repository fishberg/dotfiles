fix-mouse(){
    xinput_id=`xinput --list | grep "Synaptics TM2438-005" | grep -Eo "id=[[:digit:]]+" | cut -d= -f2`
    xinput --disable $xinput_id
    xinput --enable $xinput_id
}
