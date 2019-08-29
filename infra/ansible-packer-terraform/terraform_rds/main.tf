provider "aws" {
  region = "ap-northeast-1"
  profile = ""
}

data "aws_security_group" "instance" {
  name = "terraform-mo_is_awesome-instance-${terraform.workspace}"
}

resource "aws_db_instance" "mo_is_awesome-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.3.8"
  instance_class       = "db.t2.micro"
  name                 = "mo_is_awesome"
  username             = "root"
  #password             = "{var.rds_passwd}"
  parameter_group_name = "default.mariadb10.3"
  vpc_security_group_ids = [ "${aws_security_group.mo_is_awesome-rds.id}"]
  backup_retention_period = 7
  copy_tags_to_snapshot = true
#  maintenance_window =
#  monitoring_interval =
#  monitoring_interval =
  identifier = "terraform-mo_is_awesome-rds"
}

resource "aws_security_group" "mo_is_awesome-rds" {
  name = "terraform-mo_is_awesome-rds-${terraform.workspace}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    security_groups = ["${data.aws_security_group.instance.id}"]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

