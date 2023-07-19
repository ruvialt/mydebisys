#
# ~/.bashrc
#

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Shell Prompt
PS1='\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ '
export PS1

# *The* rc file
source "$HOME/.therc"

#
# ~/.bashrc
#
