#!/usr/bin/env bash

Source="/Applications/{{ appname }}{{ ' %sE'|format(edition) if edition else '' }}.app"
Destination="{{ homes }}/{{ user }}/Desktop"
/usr/bin/osascript -e "tell application \"Finder\" to make alias file to POSIX file \"$Source\" at POSIX file \"$Destination\""
