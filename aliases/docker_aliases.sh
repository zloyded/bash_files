#!/bin/bash


alias dkb='docker build'		# Build container

alias dki='docker images' 		# List docker images
alias dkideps='docker-image-dependencies'	# Output a graph of image dependencies using Graphiz


alias dkps='docker ps' 			# List running docker containers
alias dkpsa='docker ps -a' 		# List all docker containers

alias dkill='docker kill' 		# Kill container

alias dkrm='docker rm' 			# Remove container
alias dkrmi='docker rmi' 		# Remove image

alias dkip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

alias dkrmac='docker rm $(docker ps -a -q)' # Delete all Docker containers
alias dkrmai='docker rmi $(docker images -a -q)' # Delete all images