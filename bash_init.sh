#!/bin/bash

################################################################################
#                                                                              #
# Init script to be called from .bashrc                                        #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################

# Bash colors --> Load first
if [ -f ~/bash_files/bash_colors.sh ]; then
    . ~/bash_files/bash_colors.sh
fi

# Bash prompt
if [ -f ~/bash_files/bash_prompt.sh ]; then
    . ~/bash_files/bash_prompt.sh
fi

# Bash greeter
if [ -f ~/bash_files/bash_greeter.sh ]; then
    . ~/bash_files/bash_greeter.sh
fi
