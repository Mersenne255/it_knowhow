#! /bin/bash
withoutSftp=$(echo "$1" | sed -e 's/sftp:\/\///g')
withoutSuffix=$(echo $withoutSftp | sed -e 's/\/.*//g')
gnome-terminal -- bash -c "ssh -t "$withoutSuffix" 'cd "$2" && bash'"