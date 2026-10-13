#!/bin/bash
cd ./squidguard/db
sudo cp -r blacklists blacklists-backup
sudo rm -R blacklists
sudo rm blacklists.tar.gz*

sudo wget -dv --user anonymous --password (youremail)@example.com ftp://ftp.ut-capitole.fr/pub/reseau/cache/squidguard_contrib/blacklists.tar.gz
sudo tar -xvzf blacklists.tar.gz

##  If just updating the whitelists or added/modified the /etc/squidguard/squidguard.conf, copy and paste from here to a terminal session.

sudo squidGuard -d -C all
cd ..
sudo chown -R proxy:proxy db
