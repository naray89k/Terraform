terraform {
  backend "s3" {
    bucket = "vaanadhi-s3-c29df1"
    key    = "terraform_state/s3"
    region = "eu-west-1"
  }
}
