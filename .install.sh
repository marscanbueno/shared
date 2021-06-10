
# ask for password up-front.
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd $HOME
mkdir .dotfiles && cd .dotfiles

# hosts
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/hosts
sudo cp hosts /etc/hosts
sudo chmod o+r /etc/hosts

# motd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/motd
sudo cp motd /etc/motd
sudo chmod o+r /etc/motd

# policybanner.rtfd

mkdir PolicyBanner.rtfd && cd PolicyBanner.rtfd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/PolicyBanner.rtfd/TXT.rtf
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/PolicyBanner.rtfd/LOGO.png
cd ..
sudo cp -r PolicyBanner.rtfd /Library/Security/PolicyBanner.rtfd
sudo chmod -R o+rx /Library/Security/PolicyBanner.rtfd

# Justincase, lol..  Just in case!

    # diskutil apfs updatePreboot /

# Clean up..
cd $HOME
rm -rf .dotfiles
rm -rf .install.sh
