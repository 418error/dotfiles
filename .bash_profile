#Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Setting python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

source /usr/local/bin/virtualenvwrapper.sh

# I like tunning the colors of the prompt in the first place:
export CLICOLOR='true'
export  LSCOLORS="gxfxcxdxbxCgCdabagacad"
export EDITOR=vi

# Install Bash Completion (required by git flow completion)
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
   . `brew --prefix`/etc/bash_completion
fi

# Install Git Flow Completion
# https://github.com/bobthecow/git-flow-completion
source ~/.git-flow-completion.bash

# Install Git completeion and repo state for OSX
# http://neverstopbuilding.com/gitpro
source ~/.git-completion.bash
source ~/.git-prompt.sh

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true

export PS1=$LIGHT_GRAY"\u@\h"'$(
   if [[ $(__git_ps1) =~ \*\)$ ]]
   # a file has been modified but not added
   then echo "'$YELLOW'"$(__git_ps1 " (%s)")
   elif [[ $(__git_ps1) =~ \+\)$ ]]
   # a file has been added, but not commited
   then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
   # the state is clean, changes are commited
   else echo "'$CYAN'"$(__git_ps1 " (%s)")
   fi)'$BLUE" \W"$GREEN": "

# Install SSH autocompleting hostnames, write ssh and press tab
# http://www.harecoded.com/terminal-tuning-for-git-developers-in-mac-2364711
complete -W "$(while read line; do echo ${line%%[, ]*}; done < ~/.ssh/known_hosts)" ssh

# Usefull aliases
alias ll='ls -lah'
alias gg='git status -s'

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Init jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export PATH="$HOME/.jenv/bin:$PATH"
