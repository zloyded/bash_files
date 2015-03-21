#!/bin/bash
#
#

# ------------------------------------------------------------------------------
# Print external/public IP
# ------------------------------------------------------------------------------
#
extip()
{
	printf "Public IP is: ${BETTER_YELLOW} $_bf_ext_ip"
}


# ------------------------------------------------------------------------------
# Print all 256 bash colors
# Source: http://misc.flogisoft.com/bash/tip_colors_and_formatting
# ------------------------------------------------------------------------------
#
colors()
{
	for fgbg in 38 48 ; do #Foreground/Background
		for color in {0..256} ; do #Colors
			#Display the color
			echo -en "\e[${fgbg};5;${color}m ${color}\t\e[0m"
			#Display 10 colors per lines
			if [ $((($color + 1) % 10)) == 0 ] ; then
				echo #New line
			fi
		done
		echo #New line
	done
}