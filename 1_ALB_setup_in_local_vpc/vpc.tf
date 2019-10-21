resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_subnets" {
  count             = length(data.aws_availability_zones.azs.names)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
}

resource "aws_security_group" "vaanu-alb-sg" {
  vpc_id      = aws_default_vpc.default.id
  name        = "vaanu-alb-sg"
  description = "ELB security group that allows forwards request comes to port 80"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vaanu-alb-sg"
  }
}

resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_default_vpc.default.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["81.132.43.69/32"]
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.vaanu-alb-sg.id]
  }
  #ingress {
  #from_port   = 80
  #to_port     = 80
  #protocol    = "tcp"
  #cidr_blocks = ["0.0.0.0/0"]
  #}
  tags = {
    Name = "allow-ssh-sg"
  }
}
