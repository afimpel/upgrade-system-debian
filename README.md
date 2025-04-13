# upgrade-system-debian
Update to Debian Linux, to perform a series of commands to make it more user friendly.

## Desktop
‼️ user with root permissions (sudo). ‼️

### Version one link.
* open terminal favorite
* copy and paste command below

```bash
wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/installer-desktop.sh | sudo bash  
```
----


## terminal version
‼️ user with root permissions (sudo). ‼️

### Version one link.
* open terminal favorite
* copy and paste command below

 ```bash
 wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/installer.sh | sudo bash  
```
----

### version Git.
‼️ All as root. ‼️
* open terminal favorite
* login as root
* Copy and paste the commands below step by step without skipping any steps.

```bash
 git clone https://github.com/afimpel/upgrade-system-debian.git
 cd upgrade-system-debian/
 cp upgrade-* /usr/bin/
 cp package-up* /usr/bin/
 chmod 777 /usr/bin/upgrade-system* -R
 chmod 777 /usr/bin/package-up* -R
 apt-get install sudo xterm wget curl -y
 echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
 echo "%wheel ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown, /usr/bin/upgrade-syste*, /usr/bin/package-update" >> /etc/sudoers.d/wheel
 adduser $(getent passwd 1000 | cut -d: -f1) wheel
 ```
‼️ Important remember that this GIT method is for terminal use only. ‼️
----
# Terminal usage mode.

## Run
### ROOT user. 
```sh
package-update
upgrade-system
upgrade-system-poweroff
upgrade-system-reboot
```

### Sudo User.
```sh
sudo package-update
sudo upgrade-system
sudo upgrade-system-poweroff
sudo upgrade-system-reboot
```