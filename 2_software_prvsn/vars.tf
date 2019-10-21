variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1  = "ami-020a9a7369c26052b"
    us-west-2  = "ami-0ddba1929e996e2dc"
    eu-west-2  = "ami-00a1270ce1e007c27"
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
  default = "ec2-user"
}
