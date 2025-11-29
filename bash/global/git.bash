#!/usr/bin/env bash

alias git_open="$DOTFILES_ROOT/scripts/gitopen.py"
alias git_link="git remote get-url origin"
alias git_info="gitlink; git branch --show-current"

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
    firefox -new-tab https://github.com/new
}
