resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  count                  = length(data.aws_availability_zones.azs.names)
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  availability_zone      = element(data.aws_availability_zones.azs.names, count.index)
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = aws_key_pair.mykey.key_name
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  connection {
    #host        = element(aws_instance.example.*.public_ip, count.index)
    host        = self.public_ip
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  tags = {
    Name = "Instance-${count.index + 1}"
    # Name = "Vaanathi-Instance"
  }
}

output "instance_ips" {
  value = aws_instance.example.*.public_ip
}
