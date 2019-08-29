#!/bin/bash -xe
clear
OLD_NAME="mo_is_awesome"
NEW_NAME=$1
sleep 1
sed -e 's/'$OLD_NAME'/'$NEW_NAME'/' `cat ./list`
echo "you have ten seconds to abort"
sleep 10
sed -i 's/'$OLD_NAME'/'$NEW_NAME'/' `cat ./list`

