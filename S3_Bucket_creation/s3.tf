resource "aws_s3_bucket" "b" {
  bucket = "vaanadhi-s3-c29df1"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name = "vaanadhi_s3_c29df1"
  }
}

resource "aws_s3_bucket_object" "state_store" {
    bucket = aws_s3_bucket.b.id
    acl    = "private"
    key    = "terraform_state/s3"
}
