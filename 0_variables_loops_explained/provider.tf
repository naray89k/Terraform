provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}

# resource "aws_vpc" "captain" {
#   cidr_block = "${var.vpc_cidr}"
#   instance_tenancy = "default"
#   tags {
#     Name = "Main"
#     location = "Bangalore"
#   }
# }
#
# resource "aws_subnet" "subnets" {
#   count = "${length(data.aws_availability_zones.azs.names)}"
#   availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
#   vpc_id = "${aws_vpc.captain.id}"
#   cidr_block = "${element(var.subnet_cidr,count.index)}"
#   tags {
#     Name = "Subnet-${count.index+1}"
#   }
# }

output "available_zones" {
  value = data.aws_availability_zones.azs.names
}
