# Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
}

resource "aws_subnet" "pub_subnets" {
  count                   = length(data.aws_availability_zones.azs.names)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidr, count.index)
  map_public_ip_on_launch = "true"
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  # tags {
  #   Name = "main-public-${count.index + 1}"
  # }
}

resource "aws_subnet" "pvt_subnets" {
  count                   = length(data.aws_availability_zones.azs.names)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.private_subnet_cidr, count.index)
  map_public_ip_on_launch = "false"
  availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
  # tags {
  #   Name = "main-private-${count.index + 1}"
  # }
}

# resource "aws_subnet" "main-private-1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = element(var., count.index)
#   map_public_ip_on_launch = "false"
#   availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
#
#   tags {
#     Name = "main-private-1"
#   }
# }
#
# resource "aws_subnet" "main-private-2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.5.0/24"
#   map_public_ip_on_launch = "false"
#   availability_zone       = "eu-west-1b"
#
#   tags {
#     Name = "main-private-2"
#   }
# }
#
# resource "aws_subnet" "main-private-3" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.6.0/24"
#   map_public_ip_on_launch = "false"
#   availability_zone       = "eu-west-1c"
#
#   tags {
#     Name = "main-private-3"
#   }
# }

output "public_subnet_ids" {
  value = [aws_subnet.pub_subnets.*.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.pvt_subnets.*.id]
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
}

# route tables
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
}

# route associations public
# resource "aws_route_table_association" "main-public-1-a" {
#   subnet_id      = aws_subnet.main-public-1.id
#   route_table_id = aws_route_table.main-public.id
# }
# resource "aws_route_table_association" "main-public-2-a" {
#   subnet_id      = aws_subnet.main-public-2.id
#   route_table_id = aws_route_table.main-public.id
# }
# resource "aws_route_table_association" "main-public-3-a" {
#   subnet_id      = aws_subnet.main-public-3.id
#   route_table_id = aws_route_table.main-public.id
# }
