alias src='source ~/.bashrc'
alias vi=nvim
alias copy='xclip -selection c'
alias strip='nbstripout *.ipynb'
alias exe='chmod +x'
alias open='nohup nautilus -w . >/dev/null 2>&1'

alias home='cd ~'
alias downloads='cd ~/Downloads'

alias dotfiles='cd ~/.dotfiles'
alias dotfiles_bash='cd ~/.dotfiles/bash/global'
alias dotfiles_bash_local='cd ~/.dotfiles/bash/local'
alias dotfiles_sync='git -C ~/.dotfiles pull; src'

alias ls='ls --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias lt='ls -t'
alias dl='ls -t -1 ~/Downloads'

alias devel='source devel/setup.bash'

# %Y 4-digit year (e.g., 2025)
# %m 2-digit month (e.g., 10)
# %d 2-digit day (e.g., 02)
# %H hour (00-23)
# %M minute (00-59)
# %S second (00-59)
# %F shorthand for %Y-%m-%d
# %T shorthand for %H:%M:%S
alias today='date "+%F"'
alias now='date "+%Y-%m-%d_%H-%M-%S"'

alias space='du -h -d 0'
