#!/bin/bash

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   printf "This script must be run as root. Please run:\n  sudo $0\n" 1>&2
   exit 1
fi

# Install bundler
type bundle > /dev/null 2>&1 || gem install bundler

# Install gem dependencies
bundle install --quiet

# Show and write crontab
whenever
whenever -w

echo; echo "You're all set! Edit config/schedule.rb if you want to change the SHUTDOWN_TIME."
