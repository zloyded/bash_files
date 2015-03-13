#!/bin/bash


function __set_ls_aliases()
{
	# enable color support of ls and also add handy aliases
	if [ -x $(which dircolors) ]; then
	    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	    
	    alias dir='dir --color=auto'
	    alias vdir='vdir --color=auto'

	    alias ls='ls --color=auto'
	    alias ll='ls -alF --group-directories-first'
		alias la='ls -A --group-directories-first'
		alias l='ls -CF --group-directories-first'
	fi
}

__set_ls_aliases
