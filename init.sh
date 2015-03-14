#!/bin/bash
#
#

# ------------------------------------------------------------------------------
#
# Initialization file
# -------------------
# The following is done here:
# - OS detection, value is written to _bf_ostype
# - Sourcing of all the needed dirs/files in the correct order:
#	1. Source /lib/pre_base*.sh
#	2. Source /config/*config.sh
#	3. Source /lib/base*.sh
#	4. Source /aliases/*aliases.sh
#	5. 
# - Load start screen /lib/start_screen.sh
# - Unset unneeded variables
#
# ------------------------------------------------------------------------------


# -------------------------------
# Detect OS type
# -------------------------------
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
# 1. Load /lib/pre_base*.sh files
# -------------------------------
#
for file in ~/.bash_files/lib/pre_base*.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# 2. Load config files
# -------------------------------
#
for file in ~/.bash_files/config/*config.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# 3. Load base files
# -------------------------------
#
for file in ~/.bash_files/lib/base*.sh; do
  [ -r "$file" ] && source "$file"
done
unset file


# -------------------------------
# 4. Load alias files
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