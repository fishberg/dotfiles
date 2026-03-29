#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

sudo usermod -a -G dialout $USER
