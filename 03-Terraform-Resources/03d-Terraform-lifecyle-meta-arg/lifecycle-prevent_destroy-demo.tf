locals {
  availability_zone = "us-east-1b"
}

resource "aws_instance" "web-us-east-1" {
  instance_type               = "t2.micro"
  ami                         = "ami-026b57f3c383c2eec"
  key_name                    = "terraform-key"
  associate_public_ip_address = true
  availability_zone           = local.availability_zone
  user_data                   = file("${path.module}/apache-install.sh")

  root_block_device {
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
  }
  tags = {
    Name = "web-server1-${local.availability_zone}"
  }

  lifecycle {
    prevent_destroy = true   // This will prevent us from destroying the resources.
  }
}
