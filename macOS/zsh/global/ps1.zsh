# foreground color
BLACK="%{$(tput setaf 0)%}"
RED="%{$(tput setaf 1)%}"
GREEN="%{$(tput setaf 2)%}"
YELLOW="%{$(tput setaf 3)%}"
BLUE="%{$(tput setaf 4)%}"
PURPLE="%{$(tput setaf 5)%}"
CYAN="%{$(tput setaf 6)%}"
WHITE="%{$(tput setaf 7)%}"

# background color
BG_BLACK="%{$(tput setab 0)%}"
BG_RED="%{$(tput setab 1)%}"
BG_GREEN="%{$(tput setab 2)%}"
BG_YELLOW="%{$(tput setab 3)%}"
BG_BLUE="%{$(tput setab 4)%}"
BG_PURPLE="%{$(tput setab 5)%}"
BG_CYAN="%{$(tput setab 6)%}"
BG_WHITE="%{$(tput setab 7)%}"

RESET="%{$(tput sgr0)%}"
BOLD="%{$(tput bold)%}"

# Source git prompt if not already available (adjust path as needed)
GIT_PROMPT=/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
[[ -f "$GIT_PROMPT" ]] && source "$GIT_PROMPT"

# Enable prompt substitution (required for $(...) in PROMPT)
setopt PROMPT_SUBST

# no git prompt
#export PROMPT=$'\n'"${GREEN}\u@\h${WHITE}:${YELLOW}%~${WHITE}"$'\n'"$ "

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT=$'\n'"${GREEN}%n@%m${WHITE}:${YELLOW}%~${CYAN}"'$(__git_ps1)'"${WHITE}"$'\n'"$ ${RESET}"
