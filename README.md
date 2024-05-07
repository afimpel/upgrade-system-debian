# upgrade-system-debian
Upgrade to Debian Linux

## terminal version
### version Git.

‼️ All as root or with root permissions. ‼️
```sh
git clone https://github.com/afimpel/upgrade-system-debian.git 
cd upgrade-system-debian/ 
cp upgrade-* /usr/bin/ 
chmod 777 /usr/bin/upgrade-system* -R
```
----

### Version one link.

‼️ All as root or with root permissions. ‼️
 ```sh
 wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/installer.sh | bash 
 ```

----

### Run
#### ROOT user.

```sh
upgrade-system 
upgrade-system-poweroff 
upgrade-system-reboot 
```

#### Sudo User.

```sh
sudo upgrade-system 
sudo upgrade-system-poweroff 
sudo upgrade-system-reboot
```

----

## Desktop
### Version one link.

‼️ All as root or with root permissions. ‼️
```sh
wget --no-cache -O - https://raw.githubusercontent.com/afimpel/upgrade-system-debian/main/installer-desktop.sh | sh 
```
