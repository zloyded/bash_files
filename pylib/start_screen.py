#!/usr/bin/env python3
# -*- coding:utf-8 -*-


import sys_info
import traceback

import base_colors
import print_functions

OS_TYPE = None


def display_infos():
    try:
        # Set OS type globally
        global OS_TYPE
        OS_TYPE = sys_info.get_os_type()
        # Print Hostname
        print_functions.print_hostame()

        # Print CPU and RAM info
        print_functions.print_centered_string(
            sys_info.get_cpu_info() + " - " +
            sys_info.get_ram_info() + " RAM",
            base_colors.bcolors.fg.better_orange)

        # Print OS info
        print_functions.print_centered_string(
            sys_info.get_os_info(),
            base_colors.bcolors.fg.better_yellow)

        # Print Distro info
        print_functions.print_centered_string(
            sys_info.get_distro_info(),
            base_colors.bcolors.fg.cyan)

    except Exception:
        traceback.print_exc()


display_infos()
