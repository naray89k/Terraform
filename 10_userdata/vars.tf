variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1  = "ami-020a9a7369c26052b"
    us-west-2  = "ami-0ddba1929e996e2dc"
    eu-west-1  = "ami-08eb05c142193af92"
    ap-south-1 = "ami-54d2a63b"
  }
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "vpc_cidr" {
  default = "190.160.0.0/16"
}

variable "public_subnet_cidr" {
  type    = list
  default = ["190.160.1.0/24", "190.160.2.0/24", "190.160.3.0/24"]
}

variable "private_subnet_cidr" {
  type    = list
  default = ["190.160.4.0/24", "190.160.5.0/24", "190.160.6.0/24"]
}

# Declare the data source
data "aws_availability_zones" "azs" {}
