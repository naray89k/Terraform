# AWS REGION
variable "AWS_REGION" {
  type    = string
  default = "eu-west-2"
}

# UBUNTU - regionwise AMI IDs
variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-020a9a7369c26052b"
    us-west-2 = "ami-0ddba1929e996e2dc"
    # eu-west-2 = "ami-00a1270ce1e007c27"
    eu-west-2  = "ami-0be057a22c63962cb"
    ap-south-1 = "ami-54d2a63b"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
  # default = "ec2-user"
}

data "aws_availability_zones" "azs" {}

data "aws_sns_topic" "cpu_monitor_sns" {
  name = "cpu_monitor_notification"
}

variable "EMAIL" {
  default = "narayanan.k.8994@gmail.com"
}
