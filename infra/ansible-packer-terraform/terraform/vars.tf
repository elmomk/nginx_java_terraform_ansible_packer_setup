variable "centos_image" {
  description = "centos image for ap-northeast-1"
  default     = "ami-045f38c93733dd48d"
}
variable "region" {
  description = "tokyo region"
  default     = "ap-northeast-1"
}
variable "instance_type" {
  description = "aws instance type"
  default     = "t2.micro"
}
variable "profile" {
  description = "aws profile"
  default     = ""
}
variable "owners_ami" {
  description = "owners ami number: in this case from quantumTW"
  default     = ""
}
