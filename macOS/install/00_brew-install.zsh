#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
