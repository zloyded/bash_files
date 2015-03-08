#!/bin/bash
#
# Source all necessary files in correct order (bash colors first)


# $OSTYPE
case "$OSTYPE" in
	linux*)
		bf_ostype="linux"
		;;
    darwin*)
		bf_ostype="osx"
		;;
	*)
		printf "%s\n" "Unable to detect OS type, assuming Linux"
		bf_ostype="linux"
		;;
esac


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