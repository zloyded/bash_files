#!/bin/bash

################################################################################
#                                                                              #
# Init script to be called from .bashrc                                        #
#                                                                              #
# binaryanomaly - v0.2                                                         #
#                                                                              #
################################################################################

#tput init
#tput reset

# Set term to 256color mode, if 256color is not supported, colors won't work properly
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then 
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

# Bash colors --> Load first
if [ -f ~/.bash_files/bash_colors.sh ]; then
    . ~/.bash_files/bash_colors.sh
fi

# Bash prompt
if [ -f ~/.bash_files/bash_prompt.sh ]; then
    . ~/.bash_files/bash_prompt.sh
fi

# Bash greeter
if [ -f ~/.bash_files/bash_greeter.sh ]; then
    . ~/.bash_files/bash_greeter.sh
fi

# Alias definitions
if [ -f ~/.bash_files/bash_aliases.sh ]; then
    . ~/.bash_files/bash_aliases.sh
fi
