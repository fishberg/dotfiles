autopy(){
    #tmp=$(mktemp)
    #register-python-argcomplete $1 > $tmp; source $tmp
    eval "$(register-python-argcomplete $1)"
}

fix-mouse-tsubaki(){
    xinput_id=`xinput --list | grep "Synaptics TM2438-005" | grep -Eo "id=[[:digit:]]+" | cut -d= -f2`
    xinput --disable $xinput_id
    xinput --enable $xinput_id
}

fix-mouse-iwakura(){
    sudo modprobe -r psmouse
    sudo modprobe psmouse
}

fix-mouse(){
    case $(hostname) in
        tsubaki)
            fix-mouse-tsubaki
            ;;

        iwakura)
            fix-mouse-iwakura
            ;;

        *)
            echo "$(hostname) does not have a registered fix-mouse function"
            ;;
    esac
}
