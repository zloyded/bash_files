#!/bin/bash


_get_ext_ip()
{
	# Get IP using dig and OpenDNS
	if [[ -x $(which dig) ]]; then
		_bf_ext_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
	fi
	
	# dig is better but if you only have port 80 available wget may become atrractive
    # wget -qO- http://ipecho.net/plain
}

# print external ip
extip()
{
	_get_ext_ip
	printf "$_bf_ext_ip"
}