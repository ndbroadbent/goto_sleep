#!/bin/bash
echo "Removing notification tasks for current user..."
whenever -f notification_schedule.rb -c
echo "Removing shutdown task for root user..."
sudo whenever -f shutdown_schedule.rb -c
