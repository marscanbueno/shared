
cd $HOME
mkdir .dotfiles && cd .dotfiles

# hosts
sudo mv 
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/hosts
sudo cp hosts /etc/hosts
sudo chmod o+r /etc/hosts

# motd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/motd
sudo cp motd /etc/motd
sudo chmod o+r /etc/motd

# policybanner.rtfd

mkdir policybanner.rtfd && cd policybanner.rtfd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/policybanner.rtfd/TXT.rtf
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/policybanner.rtfd/LOGO.png
sudo cp -r policybanner.rtfd /Library/Security/PolicyBanner.rtfd
sudo chmod -R o+rx /Library/Security/PolicyBanner.rtfd

# diskutil apfs updatePreboot /

# Clean up..
cd $HOME
rm -rf .install.sh
