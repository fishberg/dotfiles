#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# https://code.claude.com/docs/en/terminal-guide#macos-and-linux
curl -fsSL https://claude.ai/install.sh | bash
