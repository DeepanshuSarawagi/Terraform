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
  instance_type               = "t2.micro"
  security_groups = [aws_security_group.vpc-dev-sg-east-1.id]
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
  user_data = file("${path.module}/apache-install.sh")
  key_name = "terraform-key"

  root_block_device {
    encrypted             = true
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = "EC2-Terraform-East"
    tag1 = "Web-server"
  }
}