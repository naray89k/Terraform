provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-54d2a63b"
  instance_type = "t2.micro"
}
