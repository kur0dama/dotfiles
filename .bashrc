################################################################################
# BOILERPLATE
################################################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


################################################################################
# XTERM COSMETICS
################################################################################

# If this is an xterm set the title to user@host:dir
parse_git_bg() {
  if [[ $(git status -s 2> /dev/null) ]]; then
    echo -e "\033[0;31m"
  else
    echo -e "\033[0;32m"
  fi
}

PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;34m\]@\[\033[0;34m\]\h \w\[$(parse_git_bg)\]$(__git_ps1)\n\[\033[0;32m\]\$\[\033[0m\] '

################################################################################
# ALIASES
################################################################################

alias ll='ls -alF --color=auto'
alias vo='vim $(fzf)'
alias ra='ranger'

################################################################################
# CUSTOM FUNCTIONS
################################################################################

rmcr() {
    sed -i -e "s/\r$//" $1
}

################################################################################
# GIT ALIASES
################################################################################

alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main'
alias gcod='git checkout dev'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpob='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gr='git rebase'
alias gri='git rebase -i'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

################################################################################
# KEY BINDINGS
################################################################################

bind "TAB:menu-complete"
bind "set show-all-if-ambiguous off"

################################################################################
# PATH
################################################################################

[ -d "~/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d "~/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "/usr/local/go/bin" ] && export PATH=$PATH:/usr/local/go/bin

################################################################################
# SOURCE EXTERNAL FILES
################################################################################

[ -d "~/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/lib/git-core/git-sh-prompt
