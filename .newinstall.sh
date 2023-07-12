# .update_policybanner.sh
    echo ""
    echo ".update_policybanner.sh"
    echo ""

# Will run all commands as the user
    sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'

echo "checking if $HOME/.dotfiles exists"
    cd $HOME
    if [ -f $HOME/.dotfiles ]; then
        # Force delete old PolicyBanner.rtfd
        sudo rm -rfv $HOME/.dotfiles
    fi

    mkdir -v .dotfiles
    cd .dotfiles

# Check if old PolicyBanner.rtfd exists
    if [ -f $HOME/.dotfiles/main.zip ]; then
        # Force delete old PolicyBanner.rtfd
        sudo rm -rfv $HOME/.dotfiles/main.zip
    fi
    if [ -f $HOME/.dotfiles/shared-main ]; then
        # Force delete old PolicyBanner.rtfd
        sudo rm -rfv $HOME/.dotfiles/main.zip
        sudo rm -rfv $HOME/.dotfiles/shared-main
    fi

    echo ""
    echo "copying files.."
    curl -L -O https://github.com/marscanbueno/shared/archive/refs/heads/main.zip

# Check if old PolicyBanner.rtfd exists
    if [ -f /Library/Security/PolicyBanner.rtfd ]; then
        # Force delete old PolicyBanner.rtfd
        sudo rm -rfv /Library/Security/PolicyBanner.rtfd
    fi

# Unzip main.zip
    unzip main.zip

# set volume
    osascript -e "set volume output volume 30"

say "Security settings downloaded!"
    echo "Security settings downloaded!"

# open terminal
    open -a Terminal
    history -p
    echo ""
    echo ""