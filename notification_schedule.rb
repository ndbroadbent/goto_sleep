# Adjust shutdown time and alert times in config.yml
require 'yaml'
config = YAML.load_file('config.yml')

def command_exists(command)
  `which #{command} 2>/dev/null`
  $?.success?
end

if command_exists 'notify-send'
  # Linux
  job_type :notification, 'cd :path && notify-send -i ":path/cat_sleep_icon.png" ":task" ":message"'

elsif command_exists 'terminal-notifier'
  # OS X
  options = {
    title: ':task',
    message: ':message',
    appIcon: 'moon_zzz.png',
    contentImage: 'cat_sleep_icon.png'
  }
  options_string = options.map {|k,v| "-#{k} \"#{v}\"" }.join(" ")
  job_type :notification, "cd :path && terminal-notifier #{options_string}"

else
  puts "Could not find notify-send or terminal-notifier in your PATH. Make sure you've run `bundle install` on Mac."
  exit 1
end

config['alert_times'].each do |min|
  every :day, :at => "#{min} minutes before #{config['shutdown_time']}" do
    notification "#{min} minutes until shutdown!", message: 'Save all your work and get ready to go to bed.'
  end
end

every :day, :at => config['shutdown_time'] do
  notification "Shutting down!", message: 'Good night!'
end
