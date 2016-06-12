export PATH=~/bin:$PATH

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# git branch indicator
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

BLUE="\[\033[0;36m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

export PS1="${BLUE}Detoo-MBP${NO_COLOR}:${GREEN}\j${NO_COLOR}:\w${YELLOW}\$(parse_git_branch)${NO_COLOR}\$ "

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.aws_env ]; then
  . ~/.aws_env
fi
