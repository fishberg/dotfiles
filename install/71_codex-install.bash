#!/usr/bin/env zsh

# show commands
set -x

# exit on error, unset variable, failure in pipes
set -euo pipefail

# https://learn.chatgpt.com/docs/codex/cli
curl -fsSL https://chatgpt.com/codex/install.sh | sh
