#!/bin/bash
#
# Configure start screen info blocks


# This function prints the hostnamw
_print_hostname()
{
    # Retrieve hostname string depending on OS used
    case $_bf_ostype in
        linux)
            local STR_HOSTNAME="-= $HOSTNAME =-"
            ;;
        osx)
            local STR_HOSTNAME="-= $(scutil --get LocalHostName) =-"
            ;;
    esac

    # Check if figlet is available and config var set
    if [[ -x $(which figlet) &&  ! -z "$_bf_figlet_on" ]]; then
        # Check if lolcat is available and config var set
        if [[ -x $(which lolcat) &&  ! -z "$_bf_lolcat_on" ]]; then
            #print hostname with figlets and lolcat coloring
            _print_ascii_art_lolcat "$STR_HOSTNAME"
        else
            #Print hostename with figlets
            _print_ascii_art "$STR_HOSTNAME"
        fi
    else
        # No fancy ASCII art support available
        printf "\n${BOLD}"
        _print_centered_string "$STR_HOSTNAME"
    fi
}

_print_kernel()
{
    # Check for uname and retrieve kernel and architecture
    if [[ -x $(which uname) ]]; then
        local SYS_INFO="$(uname -srmo)"

        printf "${BETTER_YELLOW}"
        _print_centered_string "$SYS_INFO"
        printf "${NORMAL}"
    fi
}



_print_cpuram()
{
    if [[ -f /proc/cpuinfo ]]; then
        local cpuraminfo=$(grep -m 1 "model name" /proc/cpuinfo | cut -d: -f2 | sed -e 's/^ *//')
        
        if [[ -x $(which free) ]]; then
            cpuraminfo+=" - "
            cpuraminfo+=$(free -m | awk '/^Mem:/{print $2}')
            cpuraminfo+=" MB RAM"
        fi

        printf "${ORANGE}"
        _print_centered_string "$cpuraminfo"
        printf "${NORMAL}"

    fi
}



_print_distro()
{
    if [[ -x $(which lsb_release) ]]; then
        local distributor=$(lsb_release -si) # Ubuntu
        local version=$(lsb_release -sr) # 15.04
        local longname=$(lsb_release -sd) # Ubuntu Vivid Vervet (development branch)

        local distro="$longname"
        distro+=" $version"

        printf "${CYAN}"
        _print_centered_string "$distro"

    fi
}



_print_publicip()
{
    if [[ -x $(which dig) ]]; then
        local publicip=$(dig +short myip.opendns.com @resolver1.opendns.com)
        # dig is better but if you only have port 80 available wget may become atrractive
        # wget -qO- http://ipecho.net/plain

        printf "${BETTER_GREY}"
        _print_centered_string "External IP: $publicip"
    fi
}


_print_diskstats()
{
    if [[ -x $(which df) ]]; then
        # disk usage, don't show tmpfs, ecryptfs, encfs, bccfs, sfpfs
        local DISK_INFO=$(df -h -x tmpfs -x devtmpfs -x ecryptfs -x fuse.encfs -x bccfs -x afpfs -T)

        printf ${POWDER_BLUE}
        _print_centered_multiline "$DISK_INFO"
        # printf "%s\n" "$DISK_INFO" | boxes -d ada-box -ph8v1

        printf "${NORMAL}\n"
    fi
}


_print_lastlogins()
{
    if [[ -x $(which last) ]]; then
        local LAST_LOGINS=$(last -in 3 -ad)
        #local linecount=$(printf "%s\n" "$LAST_LOGINS" | grep -c '^')

        printf ${GREY}
        _print_centered_multiline "$LAST_LOGINS"

        printf "${NORMAL}\n"
    fi
}


_print_random_cmdinfo()
{
    if [[ -x $(which whatis) ]]; then
        local rnd_cmd_info="${BETTER_GREY}Random command info:${GREY}"$'\n'
        rnd_cmd_info+=$(whatis $(ls /bin | shuf -n 1))
        _print_centered_multiline "$rnd_cmd_info"

        printf "${NORMAL}\n"
    fi
}


_print_reboot_info()
{
    printf "${BETTER_YELLOW}"
    _print_centered_string "Reboot required!"
    printf "\n${NORMAL}"
}


# ############################################################################ #
#                                                                              #
# Change order of sections etc. below                                          #
#                                                                              #
# ############################################################################ #


if [ ! -z "$_bf_show_hostname" ]; then
	_print_hostname
fi


if [ ! -z "$_bf_show_cpuram" ]; then
    #__print_line
    _print_cpuram
fi


if [[ ! -z "$_bf_show_kernel" ]]; then
    _print_kernel
fi


if [[ ! -z "$_bf_show_distro" ]]; then
    _print_distro
fi


if [ ! -z "$_bf_show_publicip" ]; then
    _print_publicip
fi


if [ ! -z "$_bf_show_diskstats" ]; then
	_print_line
	_print_diskstats
fi


if [ ! -z "$_bf_show_lastlogins" ]; then
	_print_line
	_print_lastlogins
fi


# Load aliases
if [ -f ~/.bash_files/bash_aliases.sh ]; then
    . ~/.bash_files/bash_aliases.sh

    # Print function for aliases
	# which is in bash_alias.sh for easier maintenance
	if [ ! -z "$_bf_show_aliases" ]; then
		_print_line
		_print_apt_shortcuts_info
	fi
fi


if [ ! -z "$_bf_show_random_cmdinfo" ]; then

	# Check if whatis is available
	if [ -x $(which whatis) ]; then
	    _print_line
	    _print_random_cmdinfo
	fi
fi


if [ -e /var/run/reboot-required ]; then
    _print_line
    _print_reboot_info
fi
