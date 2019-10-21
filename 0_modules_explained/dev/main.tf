provider "aws" {
  region = var.AWS_REGION
}

module "my_vpc" {
  #source      = var.vpc_module_path
  source      = "../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  tenancy     = "default"
  vpc_id      = module.my_vpc.vpc_id
  subnet_cidr = "190.168.1.0/24"
}

module "my_ec2" {
  #source        = var.ec2_module_path
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = module.my_vpc.subnet_id
}
