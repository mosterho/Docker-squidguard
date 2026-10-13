# Squid and Squidguard running in Docker on a Ubuntu server (version 22.04.5)

# Features

# Quick Start (Run with Docker)

# Docker Compose Example (coming soon)

# Configuration & Environment Variables

# Tags & Versions

# Source Code (github - mosterho) & Issues



# I am very new to Docker, so this is very much a work in process

Note that my Docker profile is "mosterho19" and github is "mosterho". Source code can be found in github:  https://github.com/mosterho/Docker-squidguard
## Install Ubuntu server.
1. Install Ubuntu server. Mine is on VMware Workstation, 8G of memory with 1 processor/4 core 100Gb of disk. 
        - Accept defaults, but install ssh-server.
2. sudo apt update
3. sudo apt full-upgrade
4. sudo apt install docker docker.io docker-buildx
	- optional installs: net-tools 
5. sudo dpkg-reconfigure tzdata
6. timedatectl (confirms the tzdata change)

## Pull Docker images
1. sudo docker pull mosterho19/squidguard
2. sudo docker pull httpd

## Setup Docker files
1. There are two files and two folders that need to be created on your docker server, preferably in a /home/(your user name) folder:
	- squid.conf -- there are over 9000 lines in the original squid.conf file; this file contains about 100 lines with some of the important comments left in. Please see the github resource for this config file. This contains the minimum required to get squidguard up and running. You may need to tweek this file to get your container up and running.
	- squidGuard.conf -- Currently setup to include all localnet IP addresses, a blacklist, and whitelist. The blacklists currenly incluide ads, adult, and malware. The whitelist has one example domain. You will need to change the IP address of the redirect statement to match your IP. Please see the github resource for this config file.
		- NOTE: I have NOT yet created a script to download the blacklists from this [Blacklist FTP Download site](ftp://ftp.ut-capitole.fr/pub/reseau/cache/squidguard_contrib/blacklists.tar.gz) just yet ([same Blacklist website here](https://dsi.ut-capitole.fr/blacklists/download/)).
	- directory squidguard -- The blacklist and whitelist files within the squid db directory have been zipped as dbbackup.tar.gz. To unzip it, perform the following:
        - cd ./squidguard
		- sudo tar -xvzf dbbackup.tar.gz
			- (tar flags: -x=extract  v=verbose (which you can leave out)  z=gzip format  f=archive name)
	- directory squidguarderrors (used by the standalone httpd image) -- contains a couple folders and an index.html file. The html file is used for issuing a warning message when attempting to retrieve a blacklisted site.

There are additional files in github that are useful. There are the original Dockerfile, docker run start, and docker run stop bash scripts.

# Next Steps for this Project
1. Learn how to bring github files into Docker file.
2. Blacklist download works for a server, but learn how to run squidguard to download and rebuild blacklists along with whitelist within the Docker image.
3. Install on Microsoft Azure.