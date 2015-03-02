#!/bin/bash

################################################################################
#                                                                              #
# Bash aliases definition - Needs /.bash_functions							   #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################


__set_ls_aliases ()
{
	# enable color support of ls and also add handy aliases
	if [ -x /usr/bin/dircolors ]; then
	    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	    alias ls='ls --color=auto'
	    #alias dir='dir --color=auto'
	    #alias vdir='vdir --color=auto'

	    alias ll='ls -alF'
		alias la='ls -A'
		alias l='ls -CF'

	    alias grep='grep --color=auto'
	    alias fgrep='fgrep --color=auto'
	    alias egrep='egrep --color=auto'
	fi
}


# apt shortcuts legend
__print_apt_shortcuts_info ()
{
	local str_print="${GREEN}apts     ${GREY}=  sudo apt-cache search"$'\n'
	str_print+="${GREEN}aptshow  ${GREY}=  sudo apt-cache show"$'\n'
	str_print+="${GREEN}aptinst  ${GREY}=  sudo apt-get install -V"$'\n'
	str_print+="${GREEN}aptupd   ${GREY}=  sudo apt-get update"$'\n'
	str_print+="${GREEN}aptupg   ${GREY}=  sudo apt-get dist-upgrade -V && sudo apt-get autoremove"$'\n'
	str_print+="${GREEN}aptupgd  ${GREY}=  sudo apt-get update && sudo apt-get dist-upgrade -V &&"$'\n'
	str_print+="${GREEN}         ${GREY}   sudo apt-get autoremove"$'\n'
	str_print+="${GREEN}chkup    ${GREY}=  /usr/lib/update-notifier/apt-check -p --human-readable"$'\n'


	# print apt shortcuts
	__print_centered_multiline "$str_print" "10"
}

# set apt aliases
__set_apt_aliases ()
{
	alias apts='sudo apt-cache search'
	alias aptshow='sudo apt-cache show'
	alias aptinst='sudo apt-get install -V'
	alias aptupd='sudo apt-get update'
	alias aptupg='sudo apt-get dist-upgrade -V && sudo apt-get autoremove'
	alias aptupgd='sudo apt-get update && sudo apt-get dist-upgrade -V && sudo apt-get autoremove'

	alias chkup='/usr/lib/update-notifier/apt-check -p --human-readable'
	alias chkboot='cat /var/run/reboot-required'
}

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'