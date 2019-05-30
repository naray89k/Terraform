terraform {
  backend "s3" {
    bucket = "terraform-state-8989"
    key = "terraform/demo4"
    region = "ap-south-1"
  }
}
