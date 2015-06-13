#!/bin/bash


# apt shortcuts legend
function pkg_shortcuts_info()
{
	# Build string
	local str_print="${GREEN}apts     ${GREY}=  sudo apt-cache search"$'\n'
	str_print+="${GREEN}aptshow  ${GREY}=  sudo apt-cache show"$'\n'
	str_print+="${GREEN}aptinst  ${GREY}=  sudo apt-get install -V"$'\n'
	str_print+="${GREEN}aptupd   ${GREY}=  sudo apt-get update"$'\n'
	str_print+="${GREEN}aptupg   ${GREY}=  sudo apt-get dist-upgrade -V && sudo apt-get autoremove"$'\n'
	str_print+="${GREEN}aptupgd  ${GREY}=  sudo apt-get update && sudo apt-get dist-upgrade -V &&"$'\n'
	str_print+="${GREEN}         ${GREY}   sudo apt-get autoremove"$'\n'
	str_print+="${GREEN}aptrm    ${GREY}=  sudo apt-get remove"$'\n'
	str_print+="${GREEN}aptpurge ${GREY}=  sudo apt-get remove --purge"$'\n'
	str_print+="${GREEN}chkup    ${GREY}=  /usr/lib/update-notifier/apt-check -p --human-readable"$'\n'
	str_print+="${GREEN}pkgfiles ${GREY}=  dpkg --listfiles"

	# Print string
	_print_centered_multiline "$str_print" "10"
}


# set apt aliases
function _set_pkg_aliases()
{
	if [ -x $(which apt) ]; then
		alias apts='sudo apt-cache search'
		alias aptshow='sudo apt-cache show'
		alias aptinst='sudo apt-get install -V'
		alias aptupd='sudo apt-get update'
		alias aptupg='sudo apt-get dist-upgrade -V && sudo apt-get autoremove'
		alias aptupgd='sudo apt-get update && sudo apt-get dist-upgrade -V && sudo apt-get autoremove'
		alias aptrm='sudo apt-get remove'
		alias aptpurge='sudo apt-get remove --purge'

		alias chkup='/usr/lib/update-notifier/apt-check -p --human-readable'
		alias chkboot='cat /var/run/reboot-required'

		alias pkgfiles='dpkg --listfiles'
	fi
}

_set_pkg_aliases
