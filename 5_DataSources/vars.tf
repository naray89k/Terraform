variable "AWS_REGION" {
  default = "eu-west-2"
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
