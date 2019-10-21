#AWS REGION
variable "AWS_REGION" {
  type    = string
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "ENV" {
  default = "prod"
}

# CIDR of VPC
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

variable "instance_type" {
  default = "t2.micro"
}
