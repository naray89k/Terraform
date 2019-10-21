# AWS REGION
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

# Declare the data source
data "aws_availability_zones" "azs" {}
