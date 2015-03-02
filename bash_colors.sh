#!/bin/bash

################################################################################
#                                                                              #
# Bash tput color definition												   #
#                                                                              #
# binaryanomaly - v0.1                                                         #
#                                                                              #
################################################################################

# List all colors
# ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; ) 


NORMAL=$(tput sgr0) # Reset text format to the terminal's default


# -------------------------------

BOLD=$(tput bold)
DIM=$(tput dim)
UNDERLINE=$(tput smul)
BLINK=$(tput blink)
REVERSE=$(tput smso)

# -------------------------------

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
GREY=$(tput setaf 8)

# -------------------------------

BETTER_YELLOW=$(tput setaf 220)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
ORANGE=$(tput setaf 172)
PURPLE=$(tput setaf 141)
BETTER_GREY=$(tput setaf 245)