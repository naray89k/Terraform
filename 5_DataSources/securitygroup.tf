data "aws_ip_ranges" "eu_west_ec2" {
  regions  = ["eu-west-1", "eu-west-2"]
  services = ["ec2"]
}

resource "aws_security_group" "from_eu_west" {
  name = "from_apac"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = data.aws_ip_ranges.eu_west_ec2.cidr_blocks
  }
  tags = {
    CreateDate = data.aws_ip_ranges.eu_west_ec2.create_date
    SyncToken  = data.aws_ip_ranges.eu_west_ec2.sync_token
  }

}

output "aws_ip_ranges_from_eu_west" {
  value = data.aws_ip_ranges.eu_west_ec2.cidr_blocks
}
