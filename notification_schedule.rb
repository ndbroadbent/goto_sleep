# Adjust shutdown time and alert times in config.yml
require 'yaml'
config = YAML.load_file('config.yml')

job_type :notification, 'cd :path && terminal-notifier -title ":task" -message ":message" -appIcon "moon_zzz.png" -contentImage "cat_sleep_icon.png"'


config['alert_times'].each do |min|
  every :day, :at => "#{min} minutes before #{config['shutdown_time']}" do
    notification "#{min} minutes until shutdown!", message: 'Save all your work and get ready to go to bed.'
  end
end

every :day, :at => config['shutdown_time'] do
  notification "Shutting down!", message: 'Good night!'
end
