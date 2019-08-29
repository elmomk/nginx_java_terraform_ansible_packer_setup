provider "aws" {
}

# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "terraform-remote-state-storage-s3-mo_is_awesome"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      #prevent_destroy = true
      prevent_destroy = false
    }
}
