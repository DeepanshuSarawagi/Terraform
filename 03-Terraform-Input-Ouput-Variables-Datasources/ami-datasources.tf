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
    values = ["amzn2-ami-kernel-5.10-hvm-*x86_64-gp2"]
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