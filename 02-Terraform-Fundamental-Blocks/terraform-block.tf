terraform {
  required_version = "~> 1.7.2"  # This will allow to use terraform version > 1.7.x but < 1.8
  required_providers {
    aws = {                      // Here aws is an argument within required_providers block. Also specifically, it is a
                                 // map argument
      version = "~> 5.35"         # This will use aws provider version 4 but not version 5 if released
      source = "Hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_instance" "DemoInstance1" {
  ami = "ami-0a3c3a20c09d6f377"
  instance_type = "t2.micro"
  user_data = file("${path.module}/user-data-script.sh")
  associate_public_ip_address = "true"
  availability_zone = "us-east-1b"
  tags = {
    Name = "TerraformEC2Demo"
  }
}