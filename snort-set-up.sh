#!/bin/bash

# changing the sources.list
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo find /var/lib/apt/lists -type f -exec rm -rf {} \;
# download ubuntu source.list
sudo wget https://gist.githubusercontent.com/ishad0w/788555191c7037e249a439542c53e170/raw/3822ba49241e6fd851ca1c1cbcc4d7e87382f484/sources.list -O /etc/apt/sources.list


sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
sudo apt update

sudo apt install snort

# return the sources list of kali
sudo find /var/lib/apt/lists -type f -exec rm -rf {} \;
sudo mv /etc/apt/sources.list /etc/apt/ubuntu_sources.list
sudo mv /etc/apt/sources.list.bak /etc/apt/sources.list

sudo mkdir /etc/snort /etc/snort/rules /var/log/snort
sudo touch /etc/snort/snort.conf /etc/snort/rules/icmp.rules

sudo echo 'include /etc/snort/rules/icmp.rules' > /etc/snort/snort.conf
sudo echo 'alert icmp any any -> any any (msg:"ICMP Packet"; sid:477; rev:3;)' > /etc/snort/rules/icmp.rules
# on this format => <Rule Actions> <Protocol> <Source IP Address> <Source Port> <Direction Operator> <Destination IP Address> <Destination > (rule options)

sudo echo 'run snort with this following command: snort -c /etc/snort/snort.conf -l /var/log/snort/'
