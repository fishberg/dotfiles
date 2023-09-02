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

# no git prompt
#export PS1="\n$GREEN\u@\h$WHITE:$YELLOW\w$WHITE\n$ "

# git prompt
# combines ' and " strings so __git_ps1 reevals for each prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\n$GREEN\u@\h$WHITE:$YELLOW\w$CYAN"'$(__git_ps1)'"$WHITE\n$ "
