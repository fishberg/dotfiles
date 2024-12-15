# https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/

# foreground color
BLACK='\[\033[30m\]'
RED='\[\033[31m\]'
GREEN='\[\033[32m\]'
YELLOW='\[\033[33m\]'
BLUE='\[\033[34m\]'
PURPLE='\[\033[35m\]'
CYAN='\[\033[36m\]'
WHITE='\[\033[37m\]'

# background color
BG_BLACK='\[\033[40m\]'
BG_RED='\[\033[41m\]'
BG_GREEN='\[\033[42m\]'
BG_YELLOW='\[\033[43m\]'
BG_BLUE='\[\033[44m\]'
BG_PURPLE='\[\033[45m\]'
BG_CYAN='\[\033[46m\]'
BG_WHITE='\[\033[47m\]'

#RESET='\e(B\e[m'
#BOLD='\[\033[1m\]'
#BOLD='\e[1m'

# foreground color
#BLACK=$(tput setaf 0)
#RED=$(tput setaf 1)
#GREEN=$(tput setaf 2)
#YELLOW=$(tput setaf 3)
#BLUE=$(tput setaf 4)
#PURPLE=$(tput setaf 5)
#CYAN=$(tput setaf 6)
#WHITE=$(tput setaf 7)

# background color
#BG_BLACK=$(tput setab 0)
#BG_RED=$(tput setab 1)
#BG_GREEN=$(tput setab 2)
#BG_YELLOW=$(tput setab 3)
#BG_BLUE=$(tput setab 4)
#BG_PURPLE=$(tput setab 5)
#BG_CYAN=$(tput setab 6)
#BG_WHITE=$(tput setab 7)

RESET=$(tput sgr0)
BOLD=$(tput bold)

# no git prompt
#export PS1="\n$GREEN\u@\h$WHITE:$YELLOW\w$WHITE\n$ "

# git prompt
# combines ' and " strings so __git_ps1 reevals for each prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\n$GREEN\u@\h$WHITE:$YELLOW\w$CYAN"'$(__git_ps1)'"$WHITE\n$ $WHITE"
