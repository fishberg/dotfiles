#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

sudo mkdir -p /etc/systemd/logind.conf.d
printf '%s\n' \
  '[Login]' \
  'HandleLidSwitch=ignore' \
  'HandleLidSwitchExternalPower=ignore' \
  'HandleLidSwitchDocked=ignore' \
  | sudo tee /etc/systemd/logind.conf.d/10-ignore-lid.conf

echo "system reboot required"
