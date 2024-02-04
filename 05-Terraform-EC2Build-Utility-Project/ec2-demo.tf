terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      version = "~> 5.0"
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
  for_each = toset(keys({
    for az, inst in data.aws_ec2_instance_type_offerings.myEc2Instance:
        az => inst.instance_types if length(inst.instance_types) != 0
  }))
  tags = {
    Name = "TerraformDemo-EC2-Instance-${each.key}"
  }
  availability_zone = each.key
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  associate_public_ip_address = var.associate_public_ip_address
  root_block_device {
    encrypted = true
    delete_on_termination = true
    volume_size = 30
    volume_type = "gp2"
  }
  ebs_block_device {
    device_name = "/dev/sdb"
    encrypted = true
    delete_on_termination = true
    volume_size = 8
    volume_type = "gp2"
  }
}