#!/bin/bash -xe
clear
# quantum_taiwan profile
export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3


cd infra/ansible-packer-terraform/terraform_s3_backend
terraform init -input=false
terraform plan -out=tfplan -input=false
terraform apply -input=false tfplan
cd -
cd infra/ansible-packer-terraform/terraform
terraform init -input=false
terraform plan -out=tfplan -input=false
terraform apply -input=false tfplan
cd -
cd infra/ansible-packer-terraform/terraform_rds
terraform init -input=false
terraform plan -out=tfplan -input=false
terraform apply -input=false tfplan
cd -
