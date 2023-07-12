# .update_security.sh
echo ""
echo ".update_security.sh"
echo ""

# hosts
cd $HOME/.dotfiles
sudo cp hosts /etc/hosts
sudo chmod o+r /etc/hosts
echo ""
echo "Deleting:"
sudo rm -rfv hosts

# motd
cd $HOME/.dotfiles
sudo cp motd /etc/motd
sudo chmod o+r /etc/motd
echo ""
echo "Deleting:"
sudo rm -rfv motd

echo "Deleting old PolicyBanner:"
sudo rm -rfv /Library/Security/PolicyBanner.rtfd
echo ""

# policybanner.rtfd
cd $HOME/.dotfiles
sudo cp -r PolicyBanner.rtfd /Library/Security/PolicyBanner.rtfd
sudo chmod -R o+rx /Library/Security/PolicyBanner.rtfd
sudo chmod -R o+r /Library/Security/PolicyBanner.rtfd/NWOPCS.png
sudo chmod -R o+r /Library/Security/PolicyBanner.rtfd/TXT.rtf
echo ""

# Update Preboot
diskutil apfs updatePreboot /

# flush DNS cache
sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
echo ""

# Clean up..
echo "Deleting:"
sudo rm -rfv .update_security.sh
cd $HOME
sudo rm -rfv .dotfiles
echo ""

# set volume
osascript -e "set volume output volume 30"
say "Security settings downloaded!"
echo "Security settings downloaded!"

history -p