#!/bin/bash


function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}


function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}


function reboot_required() {
	if [ ! -z "$bf_prompt_reboot_info" ]; then
		if [ -f /var/run/reboot-required ]; then
			printf "${BETTER_YELLOW}Reboot required!${NORMAL}"
		fi
	fi
}

function host_color() {
	# Detect if connection is through SSH
	if [[ ! -z $SSH_CLIENT ]]; then
		printf "${LIME_YELLOW}"
	else
		printf "${ORANGE}"
	fi

}


PS1="\$(reboot_required)\n\[$GREY\]\t\n\[$CYAN\]\u\[$GREY\]@\[\$(host_color)\]\h \[$YELLOW\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\] \[$RESET\]"