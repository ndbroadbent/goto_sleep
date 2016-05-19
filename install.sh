#!/bin/bash

# Install bundler
type bundle > /dev/null 2>&1 || {
  echo "Installing bundler..."
  gem install bundler
}

# Install gem dependencies
echo "Checking gem dependencies..."
bundle install --quiet

# Show and write crontab
echo "Showing crontab for user '$USER':"
echo "---------------------------------------------"
whenever -f notification_schedule.rb
echo -e "\n=== Installing crontab for user '$USER':"
whenever -f notification_schedule.rb -w

echo -e "\nShowing crontab for root user:"
echo      "---------------------------------"
whenever -f shutdown_schedule.rb
echo -e "\n=== Installing crontab for root user:"
sudo whenever -f shutdown_schedule.rb -w

echo -e "\nYou're all set! Edit config/schedule.rb if you want to change the SHUTDOWN_TIME."
