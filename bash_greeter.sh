#!/bin/bash

# ############################################################################ #
#                                                                              #
# Various greeting information - Needs /.bash_functions                        #
#                                                                              #
# binaryanomaly - v0.2                                                         #
#                                                                              #
# ############################################################################ #


source ~/.bash_files/bash_print_functions.sh


__print_hostname_info ()
{
    local STR_HOSTNAME="-= $HOSTNAME =-"
    local SYS_INFO="-= $(uname -srmo) =-"

    # Check if figlet is available
    if [[ -x /usr/bin/figlet ]]; then

        # Check if lolcat is available
        if [[ -x /usr/games/lolcat ]]; then
            #print hostname with figlets and lolcat coloring
            __print_ascii_art_lolcat "$STR_HOSTNAME" "$SYS_INFO"
        else
            #Print hostename with figlets
            __print_ascii_art "$STR_HOSTNAME"
        fi

    else
        __print_centered_string "$STR_HOSTNAME" "0"
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


__print_diskinfo ()
{
    # disk usage, minus def and swap
    local DISK_INFO=$(df -h -x tmpfs -x devtmpfs -x ecryptfs -x fuse.encfs -T)

    printf ${POWDER_BLUE}
    __print_centered_multiline "$DISK_INFO" "0"
    # printf "%s\n" "$DISK_INFO" | boxes -d ada-box -ph8v1

    printf "${NORMAL}\n"
}

__print_lastlogins ()
{
    # LAST_LOGINS=$(last -in 3 -ad)
    # printf "%s\n" "$LAST_LOGINS" | boxes -d ada-box -ph8v1
    local LAST_LOGINS=$(last -in 3 -ad)
    #local linecount=$(printf "%s\n" "$LAST_LOGINS" | grep -c '^')

    printf ${GREY}
    __print_centered_multiline "$LAST_LOGINS" "0"

    printf "${NORMAL}\n"
}

__print_random_cmds ()
{
    rnd_cmd_info="${BETTER_GREY}Random command info:${GREY}"$'\n'
    rnd_cmd_info+=$(whatis $(ls /bin | shuf -n 1))
    __print_centered_multiline "$rnd_cmd_info" "0"

    printf "${NORMAL}\n"
}




# ############################################################################ #
#                                                                              #
# Change order of sections etc. below                                          #
#                                                                              #
# ############################################################################ #


__print_hostname_info
__print_line

__print_diskinfo
__print_line

#__print_lastlogins
#__print_line

# Print function for aliases is in bash_alias.sh for easier maintenance
if [ -f ~/.bash_files/bash_aliases.sh ]; then
    . ~/.bash_files/bash_aliases.sh

    __print_apt_shortcuts_info
    __print_line
fi


__print_random_cmds
