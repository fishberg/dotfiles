#!/usr/bin/env bash

firefox --new-tab "https://www.connectedpapers.com/search?q=$(xclip -o)" 2> /dev/null
