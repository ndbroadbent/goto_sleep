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
echo "=== Installing crontab for user '$USER':"
whenever -f notification_schedule.rb
whenever -f notification_schedule.rb -w

echo -e "\n=== Installing crontab for root user:"
whenever -f shutdown_schedule.rb
sudo whenever -f shutdown_schedule.rb -w

echo -e "\nYou're all set! Edit config/schedule.rb if you want to change the SHUTDOWN_TIME."
