# GOTO SLEEP

### Because sometimes you look out the window and it's already 6am.

## Installation

```
git clone https://github.com/ndbroadbent/goto_sleep.git
cd goto_sleep
sudo ./install.sh
```

*(Don't clone this into `/tmp`, otherwise the notification icons will stop working after a restart.)*

The default shutdown time is 3am. You can configure this in `config/schedule.rb`.

You will also see warning notifications at 45 minutes, 25 minutes, and 5 minutes before shutdown.
