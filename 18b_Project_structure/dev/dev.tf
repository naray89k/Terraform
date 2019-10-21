module "main-vpc" {
  source               = "../modules/vpc"
  ENV                  = "dev"
  VPC_CIDR             = var.vpc_cidr
  AWS_REGION           = var.AWS_REGION
  PRIVATE_SUBNET_CIDRS = var.private_subnet_cidr
  PUBLIC_SUBNET_CIDRS  = var.public_subnet_cidr
  AZS                  = data.aws_availability_zones.azs.names
}

module "instances" {
  source             = "../modules/instances"
  ENV                = "dev"
  VPC_ID             = module.main-vpc.vpc_id
  PUBLIC_SUBNETS     = module.main-vpc.public_subnets
  INSTANCE_TYPE      = var.instance_type
  PATH_TO_PUBLIC_KEY = var.PATH_TO_PUBLIC_KEY
}
