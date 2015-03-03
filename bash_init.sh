#!/bin/bash

################################################################################
#                                                                              #
# Init script to be called from .bashrc                                        #
#                                                                              #
# binaryanomaly - v0.2                                                         #
#                                                                              #
################################################################################


# Set term to 256color mode, if 256color is not supported, colors won't work properly
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then 
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi


# Source files - bash_colors.sh first
for file in ~/.bash_files/{bash_colors.sh,bash_prompt.sh,bash_greeter.sh}; do
  [ -r "$file" ] && source "$file"
done
unset file
