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

# policybanner.rtfd
cd $HOME/.dotfiles
sudo rm -rfv PolicyBanner.rtfd
sudo cp -r PolicyBanner.rtfd /Library/Security/PolicyBanner.rtfd
sudo chmod -R o+rx /Library/Security/PolicyBanner.rtfd
sudo chmod -R o+rx /Library/Security/PolicyBanner.rtfd/NWOPCS2023.png
sudo chmod -R o+rx /Library/Security/PolicyBanner.rtfd/TXT.rtf
echo ""
echo "Deleting:"
sudo rm -rfv PolicyBanner.rtfd

# flush DNS cache
sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
echo ""

# Clean up..
echo "Deleting:"
sudo rm -rfv .update_security.sh
cd $HOME
sudo rm -rfv .dotfiles
echo ""

