# AWS REGION
variable "AWS_REGION" {
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}
