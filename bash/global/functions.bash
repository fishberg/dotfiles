autopy(){
    eval "$(register-python-argcomplete $1)"
}

# https://superuser.com/questions/62303/how-can-i-tunnel-all-of-my-network-traffic-through-ssh
tunnel(){
    sshuttle -r $1 0.0.0.0/0 -vv
}
