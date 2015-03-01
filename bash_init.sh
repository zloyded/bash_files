#!/bin/bash

################################################################################
#                                                                              #
# Init script to be called from .bashrc                                        #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################



# Bash colors
if [ -f ~/bash_dotfiles/bash_colors.sh ]; then
    . ~/bash_dotfiles/bash_colors.sh
fi

# Bash prompt --> Load after colors!
if [ -f ~/bash_dotfiles/bash_prompt.sh ]; then
    . ~/bash_dotfiles/bash_prompt.sh
fi

# Bash greeter
if [ -f ~/bash_dotfiles/bash_greeter.sh ]; then
    . ~/bash_dotfiles/bash_greeter.sh
fi

# Alias definitions.
if [ -f ~/bash_dotfiles/bash_aliases.sh ]; then
    . ~/bash_dotfiles/bash_aliases.sh
fi