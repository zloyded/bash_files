#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import os
import platform
import socket
import sys
import traceback

from collections import OrderedDict

OS_TYPE = None


def get_sysversion():
    try:
        str_version = str(sys.version)
        return str_version

    except Exception:
        traceback.print_exc


def get_os_type():
    try:
        str_os_type = os.uname()[0]  # Linux

        global OS_TYPE
        OS_TYPE = str_os_type

        return str_os_type

    except Exception:
        traceback.print_exc


def get_os_info():
    """ Get OS version infos via os.unmae
    :return: string containig the concatenated OS infos
    """

    try:
        str_os_type = os.uname()[0]  # Linux
        str_os_release = os.uname()[2]  # 3.19.0-9-generic
        str_os_arch = os.uname()[4]  # x86_64
        str_result =\
            str_os_type + " " + str_os_release + " " + str_os_arch
        return str_result

    except Exception:
        traceback.print_exc


def get_distro_info():
    """ Get the relevant distribution infos
    :return: concatenated string containig the distribution infos
    """

    try:
        str_distro =\
            platform.linux_distribution()[0] + " " +\
            platform.linux_distribution()[1] + " " +\
            platform.linux_distribution()[2]
        str_result = str_distro  # Ubuntu 15.04 vivid
        return str_result

    except Exception:
        traceback.print_exc


def get_hostname():
    """ Get the hostname with socket.gethostname()
    :return: string containig the hostname
    """

    try:
        str_host_name = str(socket.gethostname())
        return str_host_name

    except Exception:
        traceback.print_exc


def get_cpu_info():
    """ Parse CPU model name from /proc/cpuinfo
    :return: string containing CPU model name
    """

    # Intel(R) Core(TM) i7-4578U CPU @ 3.00GHz
    try:
        if OS_TYPE == "Linux":
            with open('/proc/cpuinfo') as f:
                for line in f:
                    # Ignore the blank line separating the information between
                    # details about two processing units
                    if line.strip():
                        if line.rstrip('\n').startswith('model name'):
                            model_name =\
                                line.rstrip('\n').split(':')[1].strip()
                            return(model_name)
        else:
            return "incompatible OS: " + OS_TYPE

    except Exception:
        traceback.print_exc


def get_ram_info():
    try:
        meminfo = OrderedDict()

        with open('/proc/meminfo') as f:
            for line in f:
                meminfo[line.split(':')[0]] = line.split(':')[1].strip()

        # return meminfo
        str_meminfo = str(meminfo['MemTotal'])
        return str_meminfo

    except Exception:
        traceback.print_exc


def get_extip():

    try:
        return
        # str_host_name = str(socket.gethostbyname_ex())
        # socket.getfqdn()
        # return str_host_name

    except Exception:
        traceback.print_exc
