#!/bin/bash
#
#

# ------------------------------------------------------------------------------
#
# Printf helper functions
# -----------------------
#
# Provides the following functions:
# - Print line _print_line()
# - Print ASCII art _print_ascii_art()
# - Print ASCII art with lolcat coloring _print_ascii_art_lolcat()
# - Print a string centered related to terminal width _print_centered_string()
# - Print a multiline string centered related to terminal width
#   where the longest string is considered for determining the offset
#   _print_centered_multiline()
# - Print string with a fixed offset _print_fixed_singleline() as a helper
#   function for _print_centered_multiline()
#
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Print a 80 char - line
# Usage: _print_line
# ------------------------------------------------------------------------------
_print_line()
{
    # 80 chars line
    local line="--------------------------------------------------------------------------------"
    
    printf "${GREY}"
    _print_centered_string "$line" "0"
    printf "\n"
}

# ------------------------------------------------------------------------------
# Print a string centered with figlet
# Usage: _print_ascii_art "$1"
# Param: $1  String variable to print
# ------------------------------------------------------------------------------
_print_ascii_art()
{
    printf "%s\n" "$1" | figlet -w $COLUMNS -c
    printf "${ORANGE}"
    _print_centered_string "$2"
}


# ------------------------------------------------------------------------------
# Print a string centered with figlet and lolcat coloring
# Usage: _print_ascii_art_lolcat "$1"
# Param: $1  String variable to print
# ------------------------------------------------------------------------------
_print_ascii_art_lolcat()
{
    { printf "%s\n" "$1" | figlet -w $COLUMNS -c ; __print_centered_string "$2" ; } | lolcat -S 550
}


# ------------------------------------------------------------------------------
# Print a string, centered on the terminal
# Usage: _print_centered_string "$1"
# Param: $1  String variable to print
# ------------------------------------------------------------------------------
_print_centered_string()
{
    local c_string="$1"
    local mid=$(((${#c_string}+$COLUMNS)/2))
    local leftspace=$((${mid}-${#c_string}))

    printf "%-*s%s\n" $leftspace " " "$c_string"
}


# ------------------------------------------------------------------------------
# Print a multlinestring, centered on the terminal where the longest line is
# determining the offset
# Usage: _print_centered_multiline "$1"
# Param: $1  Multiline string variable to print
# Param: $2  Fixed offset (optional)
# ------------------------------------------------------------------------------
_print_centered_multiline()
{
    # Find longest string
    local strlen=0
    while IFS= read -r line
    do
        # Store length
        if [ ${#line} -gt $strlen ]; then
            strlen="${#line}"
        fi
    done <<< "$1"

    # Apply if offset if provided
    if [[ ! -z "$2" ]]; then

        local offset=$2
        strlen=$(($strlen-$offset))

    fi

    # Print each line with offset of longest string
    while IFS= read -r line
    do
        _print_fixed_singleline "$line" "$strlen"
    done <<< "$1"

    strlen=0
}


_print_fixed_singleline()
{
    local c_string="$1"
    local mid=$(((strlen+$COLUMNS)/2))
    local leftspace=$((${mid}-strlen))
    
    printf "%-*s%s\n" $leftspace " " "$c_string"
}
