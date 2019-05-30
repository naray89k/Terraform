variable "vpc_cidr" {
  default = "190.160.0.0/16"
}

variable "tenancy" {
  default = "dedicated"
}

variable "vpc_id" {}

variable "subnet_cidr" {
  default = "190.160.1.0/24"
}
