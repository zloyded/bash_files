#!/bin/bash
#
# Source all necessary files in correct order (bash colors first)


# Detect OS
case "$OSTYPE" in
	linux*)
		_bf_ostype="linux"
		;;
    darwin*)
		_bf_ostype="osx"
		;;
	*)
		printf "%s\n" "Unable to detect OS type, assuming Linux"
		bf_ostype="linux"
		;;
esac


# -------------------------------
# Load /lib/pre_base*.sh files
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
# Initialize base files
# -------------------------------
#
for file in ~/.bash_files/lib/base*.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# Load alias files
# -------------------------------
#
for file in ~/.bash_files/aliases/*aliases.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# Load Start screen
# -------------------------------
#
if [ -f ~/.bash_files/lib/start_screen.sh ]; then
    . ~/.bash_files/lib/start_screen.sh
fi


# -------------------------------
# Cleanup variables
# -------------------------------
#
_unset_config_vars