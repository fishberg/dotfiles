alias src='source ~/.bashrc'
alias vi=nvim
alias copy='xclip -selection c'
alias strip='nbstripout *.ipynb'
alias exe='chmod +x'
alias open='nohup nautilus -w . >/dev/null 2>&1'
alias dotfiles_sync='git -C ~/.dotfiles pull; src'

alias ls='ls --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias lt='ls -t'

alias devel='source devel/setup.bash'

alias lastDL='ls -t ~/Downloads | egrep -v "\.part$" | head -1 | xargs find ~/Downloads -name'

alias today='date "+%F"'
