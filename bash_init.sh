#!/bin/bash

################################################################################
#                                                                              #
# Init script to be called from .bashrc                                        #
#                                                                              #
# binaryanomaly - v0.2                                                         #
#                                                                              #
################################################################################


# Source files - bash_colors.sh first
for file in ~/.bash_files/{bash_config.sh,bash_colors.sh,bash_prompt.sh,bash_greeter.sh}; do
  [ -r "$file" ] && source "$file"
done
unset file
