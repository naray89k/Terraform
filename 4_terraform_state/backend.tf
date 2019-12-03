terraform {
  backend "s3" {
    bucket = "tf-state-8989"
    key    = "terraform/remote_state_example"
    region = "eu-west-2"
  }
}
