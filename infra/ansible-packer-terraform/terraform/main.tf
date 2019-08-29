provider "aws" {
  #region = "${var.region}"
  #profile = "${var.profile}"
}

resource "aws_eip" "mo_is_awesome" {
  instance = "${aws_instance.mo_is_awesome.id}"
}

data "aws_ami" "mo_is_awesome_ami" {
  most_recent = true

  filter {
    name = "name"
    values = ["packer-centos-mo_is_awesome*"]
  }

  owners = ["${var.owners_ami}"]   #check aws for ami owner
}


resource "aws_instance" "mo_is_awesome" {
  ami	 		 = "${data.aws_ami.mo_is_awesome_ami.id}"
  #ami	 		 = "${var.centos_image}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  key_name		 = "${aws_key_pair.mo_is_awesome.key_name}"


 # user_data = <<-EOF
 #             #!/bin/bash
 #             echo "some ssh profile" >> /home/centos/.ssh/authorized_keys 
 #             EOF

  tags = {
      Name = "mo_is_awesomeTerraform"
  }
  
  root_block_device {
    delete_on_termination = "true"
  }

#provisioner "local-exec" {
#	command = "sleep 60; cd ../ansible && ansible-playbook -i'${aws_instance.mo_is_awesome.private_ip},' main.yml --vault-password-file=/home/gitlab-runner/.ansible_vault"
#	}

  
}

resource "aws_security_group" "instance" {
  name = "terraform-mo_is_awesome-instance-${terraform.workspace}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["1.34.165.207/32"]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "mo_is_awesome" {
  key_name   = "shared.pem"
  public_key = "cat pem file"
}
