# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

job_type :notification, 'cd :path && terminal-notifier -title ":task" -message ":message" -appIcon "moon_zzz.png" -contentImage "cat_sleep_icon.png"'

# When to shutdown
SHUTDOWN_TIME = "3am"
# When to show warning alerts
alert_times = [5, 25, 45]


alert_times.each do |min|
  every :day, :at => "#{min} minutes before #{SHUTDOWN_TIME}" do
    notification "#{min} minutes until shutdown!", message: 'Save all your work and get ready to go to bed.'
  end
end

every :day, :at => SHUTDOWN_TIME do
  notification "Shutting down!", message: 'Good night!'
  command 'sleep 5; /sbin/shutdown -h now'
end
