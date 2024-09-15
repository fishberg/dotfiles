#!/usr/bin/env bash

# https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
confirm() {
    # ${VAR:-default} uses VAR value if not null, and the default value if null
    # https://unix.stackexchange.com/questions/282807/variable-with-colon-dash-var
    prompt="${1:-Are you sure?} [y/N] "
    read -r -p "$prompt" response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

########################################

# EUID == 0 if root user
# https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
if [ "$EUID" -ne 0 ]; then
    echo "Run script as root or with sudo"
    exit
fi

# check current swap status
swapon -s

if ! confirm "Showing current swapfiles. Will detach all swapfiles and create new /swapfile (16GB). Continue?"; then
    echo "Exiting"
    exit
fi

# Show commands as they run
# https://stackoverflow.com/questions/2853803/how-to-echo-shell-commands-as-they-are-executed
set -x

# remove all swaps
swapoff -a

# create swap file (16GB)
dd if=/dev/zero of=/swapfile bs=1M count=16384 status=progress

# setup swap file
mkswap /swapfile
chmod 0600 /swapfile

# attach swap
swapon /swapfile

# Unsets show commands as they run
set +x

# add to /etc/fstab if needed
FSTAB_LINE='/swapfile                                 none            swap    sw              0       0'
if [[ $(grep -e '^/swapfile' /etc/fstab | wc -l) == 0 ]]; then
    echo "adding line to /etc/fstab"
    echo $FSTAB_LINE >> /etc/fstab
else
    echo "not adding line to /etc/fstab, detected prexisting /swapfile line"
fi

