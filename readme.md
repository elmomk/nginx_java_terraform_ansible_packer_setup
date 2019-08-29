# packer, ansible, terraform

```
.
└── ansible-packer-terraform
    ├── ansible
    │   ├── ansible.cfg
    │   ├── hosts
    │   ├── Jenkinsfilebak
    │   ├── jenkins_script.sh
    │   ├── main_packer.yml
    │   ├── main_vagrant.yml
    │   ├── main.yml
    │   ├── ping.yml
    │   ├── readme.md
    │   ├── roles
    │   ├── Vagrantfile
    │   └── vagrant_quantum_eva.yml
    ├── packer
    │   ├── template.json
    │   └── template.jsonbak_v2_vault_example
    ├── terraform
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── ta
    │   ├── terraformtf.bak
    │   ├── terraform.tfstate
    │   ├── terraform.tfstate.backup
    │   ├── tfplan
    │   └── vars.tf
    └── terraform_rds
        ├── main.tf
        ├── terraformtf.bak
        ├── terraform.tfstate
        ├── tfplan
        └── vars.tf

6 directories, 26 files

```

## scripts
1. change_name.sh: adjust the name of your project within the needed files from ***list***
2. aws_packer.sh: put your keys in here or use the variables from jenkins, builds image
3. terraform.sh: put your keys in here or use the variables from jenkins,  builds infra by using the image build with packer
consider to use a jenkins file for the var.tf file
4. combined.sh: self explanatory

## packer
 adjust the variables for your base image here:
     * region
     * source_image
     * ssh_username
     * ansible playbook

## ansible
1. main_packer.yml:
      * installs base image 
2. main.yml:
      * for use without packer
3. main_vagrant.yml:
      * for local testing

## terraform
1. terraform/main.tf:
      * ec2
      * ssh key
      * security group
2. terraform_rds/main.tf:
      * rds
      * security group which adds the above ec2-security group
3. both vars.tf have some variables in them

## authentiction:
1. bash env: written in script
2. jenkins authentication
3. .aws on local
