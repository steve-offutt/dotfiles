#!/usr/bin/env bash

# Map caps-lock to control
sudo sed -i 's/XKBOPTIONS=.*/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard
sudo udevadm trigger --subsystem-match=input --action=change
