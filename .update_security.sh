# .update_security.sh
echo ""
echo ".update_security.sh"
echo ""

# install
cd $HOME/.dotfiles/shared-main
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

# Clean up..
echo "Deleting:"
cd $HOME
sudo rm -rfv .dotfiles
echo ""

# set volume
osascript -e "set volume output volume 30"
say "Security settings configured!"
echo "Security settings configured!"

history -p