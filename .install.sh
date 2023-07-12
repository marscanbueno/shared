# .update_policybanner.sh
echo ""
echo ".update_policybanner.sh"
echo ""

# Will run all commands as the user
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'

cd $HOME
mkdir -v .dotfiles
cd .dotfiles

# .update_security.sh
echo ""
echo "copying files.."
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/.update_security.sh
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/hosts
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/motd
echo ""

echo ""
echo "copying files.."
wget https://github.com/username/repo/raw/master/PolicyBanner.rtfd.zip

# Check if old PolicyBanner.rtf exists
if [ -f /Library/Security/PolicyBanner.rtfd ]; then
    # Force delete old PolicyBanner.rtfd
    sudo rm -rfv /Library/Security/PolicyBanner.rtfd
fi

# Unzip PolicyBanner.rtfd.zip
unzip PolicyBanner.rtfd.zip

# Move PolicyBanner.rtfd to /Library/Security/
sudo mv PolicyBanner.rtfd /Library/Security/

cd ~
sudo rm -rfv ~/.dotfiles

# set volume
osascript -e "set volume output volume 30"

say "Security settings downloaded!"
echo "Security settings downloaded!"

# open terminal
open -a Terminal
sh .update_security.sh
history -p
echo ""
echo ""