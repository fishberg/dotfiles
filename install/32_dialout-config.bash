#!/usr/bin/env bash

# show commands
set -x

sudo usermod -a -G dialout $USER
