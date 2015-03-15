#!/bin/bash


_set_local_scriptname "$BASH_SOURCE"


# AWS cli command completion
if [[ -x $(which aws) ]]; then
	complete -C aws_completer aws
fi

