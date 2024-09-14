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

# Reference:
# https://www.reddit.com/r/linuxmemes/comments/v4nl8x/comment/ib55k45/?utm_source=share&utm_medium=web2x&context=3

sound_test(){
    hexdump -e '/1 "%u\n"' /dev/urandom | awk '{ split("0,2,4,5,7,8,10,12",a,",");for (i = 0; i < 1; i+= 0.0001) printf("%08X\n", 100*sin(1382*2**(a[$1 %8]/12)*i)) }' | xxd -r -p | aplay -c 2 -f S32_LE -r 16000
}

sound_test2(){
    hexdump -e '/1 "%u " /1 "%u\n"' /dev/urandom | awk '{ split("0,2,4,5,7,8,10,12",a,",");split("0.25,0.25,0.25,0.5,0.5,1",b,",");for (i = 0; i < b[$2 %7]; i+= 0.0001) printf("%08X\n", 100*sin(1382*2**(a[$1 %9]/12)*i)) }' | xxd -r -p | aplay -c 2 -f S32_LE -r 16000
}

readme_init(){
    if [[ ! -e README.md ]]; then
        echo "# $(basename $(pwd))" > README.md
    else
        echo "README.md already exists, skipping..."
    fi
}

repo_init(){
    readme_init
    git add README.md
    git commit -m "init commit"
    git branch -M main
    git push -u origin main
}

repo_new(){
    firefox -new-tab https://github.com/new
}

firelink(){
    echo "attempt connection to Firelink..."
    until nmcli device wifi rescan && nmcli device wifi connect Firelink
    do
        echo "trying again in 5 seconds..."
        sleep 5
    done
}

hdspace(){
    df -h | head -1
    df -h | grep -e "/$" --color=never
}
