#!/usr/bin/env bash

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# https://github.com/schollz/croc#install
curl https://getcroc.com | bash
