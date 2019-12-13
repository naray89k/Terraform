resource "aws_s3_bucket" "test_bucket" {
  bucket = "vaanadhi-s3-8989"
  acl    = "private"
  tags = {
    Name = "vaanadhi_s3_8989"
  }
}
