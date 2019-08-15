#!/bin/bash
user="ubuntu"
targetfolder="/home/ubuntu"
declare -A ips=( ["local"]="104.155.53.172" ["staging"]="34.76.103.52" ["prod"]="34.76.115.57")
if [ "$1" != "" ] && [ "${ips["$1"]}" != "" ]
then
    ip="${ips["$1"]}"
    scp docker-compose.yml $user@$ip:$targetfolder
    ssh $user@$ip "
        export TAG="$1"
        cd $targetfolder
        docker-compose up -d
    "
else
    keys=""
    for key in "${!ips[@]}"
    do
        keys=$keys"'"$key"', "
    done
    echo "Invalid argument, valid keys: $keys"
fi
