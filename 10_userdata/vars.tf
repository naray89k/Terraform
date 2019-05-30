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
    us-east-1 = "ami-020a9a7369c26052b"
    us-west-2 = "ami-0ddba1929e996e2dc"
    eu-west-1 = "ami-08eb05c142193af92"
    ap-south-1 = "ami-54d2a63b"
  }
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
