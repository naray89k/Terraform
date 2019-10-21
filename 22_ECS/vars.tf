
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

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}

# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
variable "ECS_AMIS" {
  type = map
  default = {
    us-east-1  = "ami-0fac5486e4cff37f4"
    us-west-2  = "ami-0e5e051fd0b505db6"
    eu-west-1  = "ami-0ae254c8a2d3346a7"
    ap-south-1 = "ami-0a8bf4e187339e2c1"
  }
}
