# .update_policybanner.sh
    echo ""
    echo ".update_policybanner.sh"
    echo ""

# Will run all commands as the user
    sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'

# Downloading and uncompressing zip from GitHub
    echo ""
    echo "Downloading from zip from GitHub.."
    curl -L -O https://github.com/marscanbueno/shared/archive/refs/heads/main.zip
    unzip main.zip

# set volume
    osascript -e "set volume output volume 30"

say "Security settings downloaded!"
    echo "Security settings downloaded!"

# open terminal
    open -a Terminal $HOME/.dotfiles/shared-main
    open -a Finder /Library/Security
    history -p
    echo ""
    echo ""
