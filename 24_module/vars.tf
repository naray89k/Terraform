# AWS REGION
variable "AWS_REGION" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  description = "Path of Private Key"
  type        = string
  default     = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  description = "Path of Public Key"
  type        = string
  default     = "mykey.pub"
}

# Declare the data source
data "aws_availability_zones" "azs" {}

variable "instance_type" {
  description = "type of aws_instance"
  type        = string
  default     = "t2.micro"
}

# CIDR of VPC
variable "vpc_cidr" {
  description = "VPCCIDR"
  type        = string
  default     = "190.160.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "PUBLIC_SUBNET_CIDRS List"
  default     = ["190.160.1.0/24", "190.160.2.0/24", "190.160.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "PRIVATE_SUBNET_CIDRS List"
  default     = ["190.160.4.0/24", "190.160.5.0/24", "190.160.6.0/24"]
}
