locals {
  availability_zone = "us-east-1b"
}

resource "aws_instance" "web-us-east" {
  instance_type               = "t2.micro"
  ami                         = "ami-026b57f3c383c2eec"
  key_name                    = "terraform-key"
  associate_public_ip_address = true
  availability_zone           = local.availability_zone

  root_block_device {
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
  }
  tags = {
    Name = "web-server1-${local.availability_zone}"
  }

  lifecycle {
    ignore_changes = [tags,key_name]   // Terraform will ignore any changes made to the real infrastructure cloud object/resource.
  }

}
