terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "EC2Demo" {
  ami                         = "ami-026b57f3c383c2eec"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1b"
  root_block_device {
    encrypted             = true
    volume_type           = "gp2"
    delete_on_termination = true
  }
  key_name = "terraform-key"
  tags = {
    Name = "EC2-Terraform-East1a"
    tag1 = "Web-server"
  }
}