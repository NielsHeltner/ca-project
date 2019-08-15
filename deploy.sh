#!/bin/bash
user="ubuntu"
targetfolder="/home/ubuntu"
if [ "$1" != "" ]
then
    ip=`./ips.sh "$1"`
    scp docker-compose.yml $user@$ip:$targetfolder
    ssh $user@$ip "
        export TAG="$1"
        cd $targetfolder
        docker-compose up -d
    "
else
    echo "No IP provided"
fi
