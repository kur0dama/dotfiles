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
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

################################################################################
# ALIASES
################################################################################

alias ll='ls -alF --color=auto'

rmcr() {
    sed -i -e "s/\r$//" $1
}

################################################################################
# KEY BINDINGS
################################################################################

bind "TAB:menu-complete"
bind "set show-all-if-ambiguous off"

################################################################################
# PATH
################################################################################

[ -d "/usr/local/texlive/2020/bin/x86_64-linux" ] && export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
[ -d "~/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d "~/bin" ] && export PATH="$HOME/bin:$PATH"

################################################################################
# SOURCE EXTERNAL FILES
################################################################################

[ -d "~/.cargo/env" ] && source "$HOME/.cargo/env"
