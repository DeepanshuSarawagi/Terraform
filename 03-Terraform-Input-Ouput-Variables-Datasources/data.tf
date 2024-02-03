/*
This file will manage the ami datasource resource which will get the latest AMI Id for Amazon linux 2.
We will dynamically find the amazon Linux2 AMI name using the filter options below and use the id attribute to get the
AMI ID. This AMI ID will be referenced in the aws_instance resource.
*/

data "aws_ami" "amzlinux2" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "default" {
  default = true
}