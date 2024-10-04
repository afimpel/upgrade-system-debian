#!/bin/sh
# Reset
UUID=$(id -u)
UUID=$(( UUID + 0 ))
I_OK="✔"
I_KO="✖️"


NC='\e[0m'
if [ $UUID != 0 ]; then
        echo "${I_KO}    Start the Script as 'root' for it to work properly    ${I_KO}";
        exit 1;
else
    userBase=${LOGNAME}

    if [ "$LOGNAME" == "root" ]; then
        userBase=${SUDO_USER}
    fi

    echo "LOGNAME: ${userBase}"

    URLgithub="https://raw.githubusercontent.com/afimpel/upgrade-system-debian"
    apt-get install sudo -y
    echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
    echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*, /usr/bin/package-update" >> /etc/sudoers.d/wheel
    addgroup wheel
    adduser $userBase wheel
    wget --no-cache -O /usr/bin/package-update ${URLgithub}/main/package-update
    wget --no-cache -O /usr/bin/upgrade-system ${URLgithub}/main/upgrade-system
    wget --no-cache -O /usr/bin/upgrade-system-poweroff ${URLgithub}/main/upgrade-system-poweroff
    wget --no-cache -O /usr/bin/upgrade-system-reboot ${URLgithub}/main/upgrade-system-reboot
    chmod 777 /usr/bin/package-update -R
    chmod 777 /usr/bin/upgrade-system* -R
fi