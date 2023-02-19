autopy(){
    eval "$(register-python-argcomplete $1)"
}

# https://superuser.com/questions/62303/how-can-i-tunnel-all-of-my-network-traffic-through-ssh
# $1 = username@hostname
tunnel(){
    sshuttle -r $1 0.0.0.0/0 -vv
}

ip_wifi(){
    wifi_paragraph=ifconfig | awk -vRS= '/wlp/'
    ipaddr=$wifi_paragraph | grep -Eo 'inet \S*' | cut -d " " -f 2
    echo $ipaddr
}

# https://linuxnightly.com/check-external-ip-from-linux-command-line/
ip_external(){
    curl ifconfig.me
}


# TODO files in file_str may not be files moved if directory is changed while on prompt
archive(){
    archive_dir=./archive/$(date '+%F')
    find_command='find . -maxdepth 1 -not -path . -not -path ./archive'
    files_str=$($find_command -printf " - %p\n")

    echo
    echo -e "to create new archive:\n - $archive_dir"
    echo
    echo -e "items to be moved:\n$files_str"
    echo
    read -p  "proceed? (y/n) " yn
    echo


    case $yn in
        y ) mkdir -p $archive_dir;
            $find_command -exec mv -v {} $archive_dir/{} \;
            echo "done";;
        * ) echo "exiting";;
    esac
}


# TODO lastDL() name doesn't work, DL() is something in bash?
dl_last(){
    ls -t --color=never ~/Downloads | egrep -v "\.part$" | head -1 | xargs find ~/Downloads -name
}

dl_mv(){
    if [ -z "$1" ]; then
        mv -v "$(dl_last)" .
    else
        mv -v "$(dl_last)" $1
    fi
}
