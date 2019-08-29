#!/bin/bash -xe
clear
cd infra/ansible-packer-terraform/packer
# quantum_taiwan profile
export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3

# packer build -var aws_access_key="<your_key>" -var aws_secret_key="<>your_key" template.json
packer build template.json
cd -
