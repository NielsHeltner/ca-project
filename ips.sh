#!/bin/bash
declare -A ips=( ["staging"]="34.76.103.52" ["prod"]="34.76.115.57")
if [ "$1" != "" ] && [ "${ips["$1"]}" != "" ]
then
    echo "${ips["$1"]}"
else
    keys=""
    for key in "${!ips[@]}"
    do
        keys=$keys"'"$key"', "
    done
    echo "Invalid argument, valid keys: $keys"
fi
