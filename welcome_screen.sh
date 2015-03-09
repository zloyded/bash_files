#!/bin/bash
#
# Configure welcome screen info blocks her


function __print_hostname_info()
{
    case $bf_ostype in
        linux)
            local STR_HOSTNAME="-= $HOSTNAME =-"
            ;;
        osx)
            local STR_HOSTNAME="-= $(scutil --get LocalHostName) =-"
            ;;
    esac


    local SYS_INFO="-= $(uname -srmo) =-"

    # Check if figlet is available
    if [[ -x $(which figlet) ]]; then

        # Check if lolcat is available
        if [[ -x $(which lolcat) ]]; then
            #print hostname with figlets and lolcat coloring
            __print_ascii_art_lolcat "$STR_HOSTNAME" "$SYS_INFO"
        else
            #Print hostename with figlets
            __print_ascii_art "$STR_HOSTNAME"
        fi

    else
        printf "\n${BOLD}"
        __print_centered_string "$STR_HOSTNAME" "0"
        printf "${ORANGE}"
        __print_centered_string "$SYS_INFO" "0"
    fi

    printf "${NORMAL}\n"
}


# deprecated, merged into hostname_info
# __print_sysinfo ()
# {
#     local SYS_INFO="-= $(uname -srmo) =-"

#     printf ${ORANGE}
#     __print_centered_string "$SYS_INFO" "0"

#     printf "${NORMAL}\n"
# }


function __print_diskinfo()
{
    # disk usage, don't show tmpfs, ecryptfs, encfs, bccfs, sfpfs
    local DISK_INFO=$(df -h -x tmpfs -x devtmpfs -x ecryptfs -x fuse.encfs -x bccfs -x afpfs -T)

    printf ${POWDER_BLUE}
    __print_centered_multiline "$DISK_INFO" "0"
    # printf "%s\n" "$DISK_INFO" | boxes -d ada-box -ph8v1

    printf "${NORMAL}\n"
}


function __print_lastlogins()
{
    # LAST_LOGINS=$(last -in 3 -ad)
    # printf "%s\n" "$LAST_LOGINS" | boxes -d ada-box -ph8v1
    local LAST_LOGINS=$(last -in 3 -ad)
    #local linecount=$(printf "%s\n" "$LAST_LOGINS" | grep -c '^')

    printf ${GREY}
    __print_centered_multiline "$LAST_LOGINS" "0"

    printf "${NORMAL}\n"
}


function __print_random_cmdinfo()
{
    rnd_cmd_info="${BETTER_GREY}Random command info:${GREY}"$'\n'
    rnd_cmd_info+=$(whatis $(ls /bin | shuf -n 1))
    __print_centered_multiline "$rnd_cmd_info" "0"

    printf "${NORMAL}\n"
}

function __print_reboot()
{
    printf "${BETTER_YELLOW}"
    __print_centered_string "Reboot required!"
    printf "\n${NORMAL}"
}


# ############################################################################ #
#                                                                              #
# Change order of sections etc. below                                          #
#                                                                              #
# ############################################################################ #


if [ ! -z "$bf_show_hostname" ]; then
	__print_hostname_info
fi


if [ ! -z "$bf_show_diskinfo" ]; then
	__print_line
	__print_diskinfo
fi


if [ ! -z "$bf_show_lastlogins" ]; then
	__print_line
	__print_lastlogins
fi


# Load aliases
if [ -f ~/.bash_files/bash_aliases.sh ]; then
    . ~/.bash_files/bash_aliases.sh

    # Print function for aliases
	# which is in bash_alias.sh for easier maintenance
	if [ ! -z "$bf_show_aliases" ]; then
		__print_line
		__print_apt_shortcuts_info
	fi
fi


if [ ! -z "$bf_show_random_cmdinfo" ]; then

	# Check if whatis is available
	if [ -x $(which whatis) ]; then
	    __print_line
	    __print_random_cmdinfo
	fi
fi


if [ -e /var/run/reboot-required ]; then
    __print_line
    __print_reboot
fi
