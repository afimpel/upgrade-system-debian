#!/bin/bash
# Reset
UUID=$(id -u)
UUID=$(( UUID + 0 ))
I_OK="✔"
I_KO="✖️"

if [ $UUID != 0 ]; then
    echo "${I_KO}    Start the Script as 'root' for it to work properly    ${I_KO}";
    exit 1;
else
    userBase=${LOGNAME}

    if [ "$LOGNAME" == "root" ]; then
        userBase=${SUDO_USER}
    fi

    CUSTOM $Yellow "Launched" $IYellow "${userBase}" $BIYellow "▶" "." "▶" 0

    URLgithub="https://raw.githubusercontent.com/afimpel/upgrade-system-debian"

    wget --no-cache -O - ${URLgithub}/main/installer.sh | bash

    mkdir -p /usr/share/pixmaps/
    mkdir -p /usr/share/applications/

    wget --no-cache -O /usr/bin/pkexec_upgrade-system ${URLgithub}/main/pkexec_upgrade-system
    wget --no-cache -O /usr/bin/pkexec_upgrade-system-poweroff ${URLgithub}/main/pkexec_upgrade-system-poweroff
    wget --no-cache -O /usr/bin/pkexec_upgrade-system-reboot ${URLgithub}/main/pkexec_upgrade-system-reboot

    wget --no-cache -O /usr/share/applications/gksu_upgrade.desktop ${URLgithub}/main/Desktop/gksu_upgrade.desktop
    wget --no-cache -O /usr/share/applications/gksu_poweroff.desktop ${URLgithub}/main/Desktop/gksu_poweroff.desktop
    wget --no-cache -O /usr/share/applications/gksu_reboot.desktop ${URLgithub}/main/Desktop/gksu_reboot.desktop

    wget --no-cache -O /usr/share/pixmaps/upgrade.png ${URLgithub}/main/Desktop/upgrade.png
    wget --no-cache -O /usr/share/pixmaps/shutdown.png ${URLgithub}/main/Desktop/shutdown.png
    wget --no-cache -O /usr/share/pixmaps/reboot.png ${URLgithub}/main/Desktop/reboot.png

    chmod 777 -v /usr/share/applications/pkexec_*
    chmod 777 -v /usr/share/pixmaps/* -R
    chmod 777 -v /usr/bin/pkexec_upgrad* -R

    echo " ";
	dates=$(date +'%Y-%m-%d %H:%M')
	CUSTOM $Green "Installation completed" $IGreen "$dates" $BWhite "✔" "." "✔" 0
fi