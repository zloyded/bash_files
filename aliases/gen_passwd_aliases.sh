#!/bin/bash
alias genpass="echo -e `date | base64 | awk '{print substr($0,0,8)}'`"



