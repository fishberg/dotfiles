#!/usr/bin/env bash

alias git_url="git remote get-url origin"
alias git_link="$DOTFILES_ROOT/scripts/git_link.py"
alias git_open='xdg-open $(git_link)'
alias git_info="git_url; git branch --show-current"

git_readme_init(){
    if [[ ! -e README.md ]]; then
        echo "# $(basename $(pwd))" > README.md
    else
        echo "README.md already exists, skipping..."
    fi
}

git_repo_init(){
    git_readme_init
    git add README.md
    git commit -m "init commit"
    git branch -M main
    git push -u origin main
}

git_repo_new(){
    xdg-open https://github.com/new
}

confirm() {
    read -rp "${1:-Continue? [y/N]} " reply
    [[ "$reply" =~ ^[Yy]$ ]]
}


git_migrate_master2main(){
    echo "Rename master branch at:"
    echo "$(git_link)/branches"
    confirm || return 1

    # exit on error + verbose
    set -ex 

    # rename branch
    git branch -m master main

    # update with knowledge from remote
    git fetch origin

    # set upstream tracking
    git branch -u origin/main main
    
    # update remote branch default
    git remote set-head origin -a

    # unset
    set +ex
}

git_migrate_https2ssh(){
    url=$(git remote get-url origin)
    if [[ $url == git@* ]]; then
        echo "error: repo already using ssh"
        return 1
    fi
    if [[ $url == https://* ]]; then
        # replace "https:// /" with "git@ :", and insert capture group 1 between
        # using # instead of / for substitution separator since url contains slashes
        url_ssh="$(echo "$url" | sed -E 's#https://([^/]+)/#git@\1:#')"
        git remote set-url origin $url_ssh
    fi
}
