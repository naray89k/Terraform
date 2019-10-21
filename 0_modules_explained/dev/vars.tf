variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "vpc_module_path" {
  default = "../modules/vpc"
}

variable "vpc_cidr" {
  default = "190.168.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "subnet_cidr" {
  default = "190.168.1.0/24"
}

variable "ec2_module_path" {
  default = "../modules/ec2"
}

variable "ami_id" {
  #default = "ami-54d2a63b"
  default = "empty"
}

variable "instance_type" {
  default = "t2.micro"
}
