terraform {
  required_version = "~> 1.2.9"  # This will allow to use terraform version > 1.2.9 but < 1.3
  required_providers {
    aws = {                      // Here aws is an argument within required_providers block. Also specifically, it is a
                                 // map argument
      version = "~> 4.0"         # This will use aws provider version 4 but not version 5 if released
      source = "Hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_instance" "DemoInstance1" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  user_data = file("${path.module}/user-data-script.sh")
  associate_public_ip_address = "true"
  availability_zone = "us-east-1b"
  tags = {
    Name = "TerraformEC2Demo"
  }
}

