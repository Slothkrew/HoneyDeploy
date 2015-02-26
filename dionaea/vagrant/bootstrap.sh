#!/usr/bin/env bash

echo "192.168.1.64    salt" >> "/etc/hosts"
sudo salt-minion -d
