#!/bin/bash
#
# Source all necessary files in correct order (bash colors first)


# $OSTYPE

# -------------------------------
# Load /lib/pre_base*.sh first
# -------------------------------
#
for file in ~/.bash_files/lib/pre_base*.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# Load config files
# -------------------------------
#
for file in ~/.bash_files/config/*config.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# Initialize base functionality
# -------------------------------
#
for file in ~/.bash_files/lib/base*.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# Load aliases
# -------------------------------
#
for file in ~/.bash_files/aliases/*aliases.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# Finally load Welcome screen
# -------------------------------
#
if [ -f ~/.bash_files/welcome_screen.sh ]; then
    . ~/.bash_files/welcome_screen.sh
fi