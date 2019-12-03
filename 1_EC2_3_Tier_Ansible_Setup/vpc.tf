resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_subnets" {
  count             = length(data.aws_availability_zones.azs.names)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
}

resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_default_vpc.default.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"

  # dynamic "ingress" {
  #   for_each = [22, 80, 3306]
  #   content {
  #     from_port = ingress.value
  #     to_port   = ingress.value
  #     protocol  = "tcp"
  #   }
  # }

  tags = {
    Name = "allow-ssh-sg"
  }
}
