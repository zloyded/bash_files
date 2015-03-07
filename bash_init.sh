#!/bin/bash

# $OSTYPE

# Load bash_colors.sh first
if [ -f ~/.bash_files/lib/pre_base_colors.sh ]; then
    . ~/.bash_files/lib/pre_base_colors.sh
fi


# Load prompt, greeter
for file in ~/.bash_files/{bash_config.sh,bash_prompt.sh,bash_greeter.sh}; do
  [ -r "$file" ] && source "$file"
done
unset file


# Initialize base functionality
for file in ~/.bash_files/lib/base*.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# Load aliases
for file in ~/.bash_files/aliases/*aliases.sh; do
  [ -r "$file" ] && source "$file"
done
unset file