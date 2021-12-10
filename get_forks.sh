#!/bin/bash
# 
# Show a list of downstream GitHub forks of a project where upstream has 1000+ forks itself
#

show_forks() {
   echo "$1 forks"
   curl -s "$2" | grep html_url | awk '{$1=$1};1' | awk 'NR%2==0' | sort;
}

# Example:
# show_forks Ecko https://api.github.com/repos/magicstone-dev/ecko/forks

show_forks "Project name" https://api.github.com/repos/<github org>/<repo>/forks
