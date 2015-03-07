#!/bin/bash

# $OSTYPE

# Source files - bash_colors.sh first
for file in ~/.bash_files/{bash_config.sh,bash_colors.sh,bash_prompt.sh,bash_greeter.sh}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Load aliases
for file in ~/.bash_files/aliases/*aliases.sh; do
  [ -r "$file" ] && source "$file"
done
unset file