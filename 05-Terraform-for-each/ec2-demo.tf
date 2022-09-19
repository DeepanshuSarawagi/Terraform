terraform {
  required_version = "~> 1.2"
  required_providers {
    aws = {
      version = "~> 4.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_instance" "ec2Demo" {
  instance_type = var.instance_type
  ami = data.aws_ami.amzlinux2.id
#  availability_zone = var.availability_zone
  key_name = var.instance_key_pair
  for_each = toset(data.aws_availability_zones.azs_east-1.names)
  tags = {
    Name = "TerraformDemo-EC2-Instance-${each.key}"
  }
  availability_zone = each.key
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  associate_public_ip_address = var.associate_public_ip_address
  root_block_device {
    encrypted = true
    delete_on_termination = true
    volume_size = 8
    volume_type = "gp2"
  }
  ebs_block_device {
    device_name = "/dev/sda"
    encrypted = true
    delete_on_termination = true
    volume_size = 8
    volume_type = "gp2"
  }
}