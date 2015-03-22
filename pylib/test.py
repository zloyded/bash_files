#!/usr/bin/env python3
# -*- coding:utf-8 -*-


import pprint
import sysconfig

stuff = sysconfig.get_config_vars()
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(stuff)
