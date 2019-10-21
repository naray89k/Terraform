resource "aws_key_pair" "keypair" {
  key_name   = "interpolation_keypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
