#!/bin/bash

type gem > /dev/null 2>&1 || {
  echo "It looks like you don't have Ruby installed!"
  echo "Run the following commands to install RVM and Ruby, then re-run \`./install.sh':"
  echo
  echo "  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
  echo "  \curl -sSL https://get.rvm.io | bash -s stable --ruby"
  echo "  source $HOME/.rvm/scripts/rvm"
  echo
  echo "Read more about RVM at: https://rvm.io/rvm/install"
  echo
  exit 1
}

# Install bundler
type bundle > /dev/null 2>&1 || {
  echo "Installing bundler..."
  gem install bundler --no-rdoc --no-ri
}

# Install gem dependencies
echo "Checking gem dependencies..."
bundle check > /dev/null 2>&1 || bundle install

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
