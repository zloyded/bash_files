#!/bin/bash
#
#


# ------------------------------------------------------------------------------
# Detect OS type and store it in ==> _bf_os_type
# ------------------------------------------------------------------------------
#
_bf_detect_os_type()
{
	case "$OSTYPE" in
		linux*)
			_bf_os_type="linux"
			;;
	    darwin*)
			_bf_os_type="osx"
			;;
		*)
			printf "%s\n" "Unable to detect OS type, assuming Linux"
			bf_os_type="linux"
			;;
	esac
}


# ------------------------------------------------------------------------------
# Get hostname and store it in ==> _bf_hostname
# ------------------------------------------------------------------------------
#
_bf_get_hostname()
{
	# Retrieve hostname string depending on OS used
    case $_bf_os_type in
        linux)
            _bf_hostname="-= $HOSTNAME =-"
            ;;
        osx)
            _bf_hostname="-= $(scutil --get LocalHostName) =-"
            ;;
        *)
			_bf_hostname="-= Unable to retrieve hostname =-"
			;;
    esac
}


# ------------------------------------------------------------------------------
# Get external/public IP and store it in ==> _bf_ext_ip
# ------------------------------------------------------------------------------
#
_bf_get_ext_ip()
{
	# Get IP using dig and OpenDNS
	if [[ -x $(which dig) ]]; then
		_bf_ext_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
	fi
	
	# dig is better but if you only have port 80 available wget may become atrractive
    # wget -qO- http://ipecho.net/plain
}

