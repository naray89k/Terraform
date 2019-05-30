resource "aws_vpc" "vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags {
    Name     = "Main"
    location = "Bangalore"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags {
    Name = "Subnet-1"
  }
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnet.id}"
}
