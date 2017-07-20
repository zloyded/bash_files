#!/bin/bash
TAG=$1
MESSAGE=$2
alias pushtag="git tag -a $TAG -m '$MESSAGE' && git push origin $TAG"
