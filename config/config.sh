#!/bin/bash

# Config section 1 = show otherwise leave empty


# Welcome screen info sections
bf_show_hostname="1"
bf_show_diskinfo="1"
bf_show_lastlogins=""
bf_show_aliases=""
bf_show_random_cmdinfo="1"

bf_figlet_on="1"
bf_lolcat_on=


# Prompt config
bf_prompt_reboot_info="1"

function __unset_config_vars()
{
	unset bf_show_hostname
	unset bf_show_diskinfo
	unset bf_show_lastlogins
	unset bf_show_aliases
	unset bf_show_random_cmdinfo

	unset bf_figlet_on
	unset bf_lolcat_on

	unset bf_prompt_reboot_info
}