#!/usr/bin/env bash

firefox --new-tab "https://scholar.google.com/scholar?q=$(xclip -o)" 2> /dev/null
