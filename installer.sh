#!/bin/bash
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*" >> /etc/sudoers.d/wheel
adduser $(getent passwd 1000 | cut -d: -f1) wheel
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/upgrade-system > /usr/bin/upgrade-system
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/upgrade-system-poweroff > /usr/bin/upgrade-system-poweroff
curl -L https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/upgrade-system-reboot > /usr/bin/upgrade-system-reboot
chmod 777 /usr/bin/upgrade-system* -R