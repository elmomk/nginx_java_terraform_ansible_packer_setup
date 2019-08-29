#!/bin/bash -xe
ACCESS_KEY=$1
SECRET_KEY=$2
REGION=$3
if [ $# != 3 ]; then
    echo "$0 access_key secret_key region"
    exit 1
fi
clear
./change_name.sh quantumQA
./aws_packer.sh $ACCESS_KEY $SECRET_KEY $REGION
./terraform.sh $ACCESS_KEY $SECRET_KEY $REGION
