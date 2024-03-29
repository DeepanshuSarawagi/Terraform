terraform {
  required_version = "~> 1.2"
  required_providers {
    aws = {
      version = "~> 5.0"
      source = "Hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile = "default"
}

resource "aws_instance" "TerraformEC2Demo1" {
  instance_type = var.instance_type
  key_name = var.instance_key_pair
  tags = {
    Name = "TerraformEC2Demo1"
  }
  availability_zone = var.availability_zone
  associate_public_ip_address = var.associate_public_ip_address
  user_data = file("${path.module}/user-data-script.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  ami = data.aws_ami.amzlinux2.id
}