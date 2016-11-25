# Adjust shutdown time and alert times in config.yml
require 'yaml'
config = YAML.load_file('config.yml')

every :day, :at => config['shutdown_time'] do
  command 'sleep 5; /sbin/shutdown -s now'
end
