#!/bin/bash

# ===========================================================================================
# 
# Revision: 2019/6/27
# Contributors: Daniel Severance
# 
# Description: Updates custom dictionary from the provided text file
#
# ===========================================================================================

# Test for potentially unsafe characters in dictionary and alert before proceeding
if egrep -q '[^A-Za-z0-9\-\_\!\@\#\$\%\^\&\*\+\=]' ./dictionary.txt;
then
    echo 'Potentially dangerous characters have been identified in dictionary:';
    egrep '[^A-Za-z0-9\-\_\!\@\#\$\%\^\&\*\+\=]' ./dictionary.txt;
    read -p "Continue (y/n)?" choice
    case "$choice" in
    y|Y|[yY][eE][sS] ) echo "Importing dictionary";;
    n|N|[nN][oO] ) echo "No action taken. Exiting"; exit 1;;
    * ) echo "Invalid option. Exiting."; exit 1;;
    esac
fi
# Extract newline delimited file and convert to comma seperated values
DICTIONARY="$(awk -vORS=, '{print $1}' ./dictionary.txt | sed 's/,$/\n/')"
# Find the dictionary variable in the web page and replace with new dictionary value
sed -i -re 's|(var\scustom_dict\s=\s\")([^\"]*)(\"\.split\(\"\,\"\))|\1'"$DICTIONARY"'\3|' ../src/index.js




