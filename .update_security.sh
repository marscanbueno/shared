#!/bin/bash

# .update_security.sh
echo ""
echo ".update_security.sh"
echo ""

sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'

# Specify the path to the folder you want to check
    folder_path="$HOME/.dotfiles"
    echo "folder_path = $folder_path"

# Check if the folder exists
    if [ -d "$folder_path" ]; then
        echo "Folder exists!"
        sudo rm -rfv $folder_path
        ls -la $folder_path
    else
        echo "Folder does not exist!"
    fi

# Check if the folder exists
    if [ -d "$folder_path" ]; then
        echo "Folder exists!"
    else
        echo "Folder does not exist!"
        mkdir $folder_path
        ls -la $folder_path
    fi

# Check if old PolicyBanner.rtfd exists
    if [ -f /Library/Security/PolicyBanner.rtfd ]; then
        # Force delete old PolicyBanner.rtfd
        sudo rm -rfv /Library/Security/PolicyBanner.rtfd
    fi

# Check if zip file has been uncompressed
    if [ -f $HOME/.dotfiles/shared-main ]; then
        # Force delete old PolicyBanner.rtfd
        sudo rm -rfv $HOME/.dotfiles/main.zip
        sudo rm -rfv $HOME/.dotfiles/shared-main
    fi

# install
    cd $folder_path/shared-main
    sudo mv PolicyBanner.rtfd /Library/Security/
    sudo chmod o+rx /Library/Security/PolicyBanner.rtfd
    sudo rm -rfv PolicyBanner.rtfd
    sudo mv hosts /etc/hosts
    sudo chmod o+r /etc/hosts
    sudo rm -rfv hosts
    sudo mv motd /etc/motd
    sudo chmod o+r /etc/motd
    sudo rm -rfv motd

# flush DNS cache & Update Preboot
    sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
    diskutil apfs updatePreboot /
    echo ""

# set volume
    osascript -e "set volume output volume 30"
    say "Security settings configured!"
    echo "Security settings configured!"
    echo ""

# Clean up..
    echo "Deleting:"
    cd $HOME
    sudo rm -rfv .dotfiles
    ls -la .dotfiles
    echo ""
    history -p
