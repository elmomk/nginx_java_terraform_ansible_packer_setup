terraform {
 backend "s3" {
 bucket = "terraform-remote-state-storage-s3"
 region = "ap-northeast-1"
 key = "mo_is_awesome/s3/terraform.tfstate"
 }
}

