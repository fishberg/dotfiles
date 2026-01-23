#!/usr/bin/env bash

firefox --new-tab "https://dblp.org/search/publ?q=$(xclip -o)" 2> /dev/null
