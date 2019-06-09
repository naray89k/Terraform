resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  tags = {
    Name = "Captain"
  }
}

output "instance_ips" {
  value = aws_instance.example.*.public_ip
}
