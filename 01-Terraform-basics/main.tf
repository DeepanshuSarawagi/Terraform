terraform {
  required_version = "~> 1.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "ec2Demo" {
  instance_type = "t2.micro"
  ami = "ami-026b57f3c383c2eec"
  availability_zone = "us-east-1a"
  associate_public_ip_address = true
  key_name = "terraform-key"

  root_block_device {
    delete_on_termination = true
    encrypted = true

  }
}