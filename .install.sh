
cd $HOME
mkdir .dotfiles && cd .dotfiles

# hosts
sudo mv 
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/hosts
sudo cp hosts /etc/hosts


# motd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/motd
sudo cp motd /etc/motd


# policybanner.rtfd

mkdir policybanner.rtfd && cd policybanner.rtfd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/policybanner.rtfd/TXT.rtf
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/policybanner.rtfd/Logo.png
