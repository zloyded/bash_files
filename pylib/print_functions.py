#!/usr/bin/env python3
# -*- coding:utf-8 -*-


import os
import sys_info
import traceback

from pyfiglet import Figlet

import base_colors


def print_hostame():
    """ Get the hostname and print it
    """
    try:
        str_hostname = "-= " + sys_info.get_hostname() + " =-"
        print("")
        print_figlet(str_hostname, get_term_width())
        print("")

    except Exception:
        traceback.print_exc()


def print_figlet(txt_string: str="", int_width: int=80):
    """ Create Figlet using pyfiglet
    """
    try:
        f = Figlet(
            font='standard',
            direction='auto',
            justify='auto',
            width=int_width)  # slant
        str_figlet = f.renderText(txt_string)
        # print(type(str_figlet))
        # print(str_figlet)
        print_centered_multiline(str_figlet, int_width)

    except Exception:
        traceback.print_exc()


def print_centered_string(txt_string: str="", fg_color: str=None):
    """ Prints a single line string centered on the console,
    a foreground ansi color code can be passed on.
    """
    try:
        # Set default fgcolor if none was provided
        if fg_color is None:
            fg_color = base_colors.bcolors.reset

        print(
            fg_color +
            txt_string.center(get_term_width()) +
            base_colors.bcolors.reset
            )

    except Exception:
        traceback.print_exc()


def print_centered_multiline(txt_string: str="", int_width: int=80):
    """ Print a multline string centered relative to the terminal width
    """
    try:
        lines = txt_string.expandtabs().splitlines()
        for line in lines:
            str_line = str(line).center(int_width)
            # str_line_len = len(str_line)
            print(str_line)

    except Exception:
        traceback.print_exc()


def get_term_width():
    """ Get terminal width
    :return: terminal width as int
    """
    try:
        (width, height) = os.get_terminal_size()
        return width

    except Exception:
        traceback.print_exc()
