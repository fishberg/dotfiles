#!/usr/bin/env bash

apt-manually-installed(){
	# apt-mark showmanual: lists all packages marked as manually installed
	# apt-mark showauto: lists all packages marked as automatically installed
	# comm -23: compares lists, showing only elements unique to first list
	# <(...): comm substitutions
	comm -23 <(apt-mark showmanual | sort) <(apt-mark showauto | sort)
}
