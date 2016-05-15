#!/bin/bash

# Install bundler
type bundle > /dev/null 2>&1 || gem install bundler

# Install gem dependencies
bundle install --quiet

# Show and write crontab
whenever -f notification_schedule.rb
whenever -f shutdown_schedule.rb

echo -e "\nInstalling notification tasks for current user..."
whenever -f notification_schedule.rb -w
echo "Installing shutdown task for root user..."
sudo whenever -f shutdown_schedule.rb -w

echo -e "\nYou're all set! Edit config/schedule.rb if you want to change the SHUTDOWN_TIME."
