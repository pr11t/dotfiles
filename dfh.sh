#!/bin/bash
set -x
# Dotfiles Helper Script #

force=false

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
				if [ -f "$target.backup" ]; then
					echo "Backup file $target.backup already exists, cant continue..."
					break
				else
					mv "$target" "$target.backup"
				fi
			fi
		fi
		ln -s "$(realpath $conf)" "$target"
	done;
done;
