#!/bin/bash


_set_local_scriptname()
{
	_bf_script_name=$(basename $1)
}


error_exit()
{
	printf "${BETTER_YELLOW}Error in $_bf_script_name:${NORMAL} ${1:-"Unknown Error"}" 1>&2
	#exit 1
}