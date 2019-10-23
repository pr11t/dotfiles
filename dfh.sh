#!/bin/bash
# Dotfiles Helper Script #

force=false
lnflags="-s"

while getopts ":f" opt; do
  case $opt in
    f)
      echo "Force mode enabled"
      force=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

# Use globs to find the config files
for dir in */; do
	for conf in $dir*; do
		# Check if file already exists
		target=~/.$(basename "$conf")
		if [ -f "$target" ]; then
			# File exists
			if [ $force = true ]; then
				if [ -h "$target" ]; then
					# It's a symlink, we don't care about backing it up
					lnflags="-sf"
				else
					# Not a symlink, make a backup just in case
					lnflags="-sfb"
				fi
			fi
		fi
		ln "$lnflags" "$(realpath $conf)" "$target" || echo "Linking failed, you can use -f to force"
	done;
done;
