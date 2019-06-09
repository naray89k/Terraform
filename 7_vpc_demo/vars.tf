#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "ap-south-1"
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

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

# Declare the data source
data "aws_availability_zones" "azs" {}
