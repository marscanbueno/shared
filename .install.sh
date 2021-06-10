
# creates a new terminal window

function new() {
    if [[ $# -eq 0 ]]; then
        open -a "Terminal" "$PWD"
    else
        open -a "Terminal" "$@"
    fi
}

echo ".install.sh 2021.0610"

# ask for password up-front.
echo ""
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd $HOME
mkdir .dotfiles && cd .dotfiles

# .update_security.sh
echo ""
echo ".update_security.sh.."
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/.update_security.sh

# hosts
echo ""
echo "fetching hosts.."
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/hosts

# motd
echo ""
echo "fetching motd.."
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/motd

# policybanner.rtfd
echo ""
echo "fetching PolicyBanner.rtfd.."
mkdir PolicyBanner.rtfd && cd PolicyBanner.rtfd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/PolicyBanner.rtfd/TXT.rtf
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/PolicyBanner.rtfd/LOGO.png

# Justincase, lol..  Just in case!

    # diskutil apfs updatePreboot /

new $HOME/.dotfiles

# Clean up..
# cd $HOME
# rm -rf .dotfiles
# rm -rf .install.sh
