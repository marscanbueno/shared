
cd $HOME
mkdir .install && cd .install

# hosts
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/hosts

# motd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/motd

# policybanner.rtfd

mkdir policybanner.rtfd && cd policybanner.rtfd
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/policybanner.rtfd/TXT.rtf
curl -LJO https://raw.githubusercontent.com/marscanbueno/shared/main/policybanner.rtfd/Logo.png

# exit
exit