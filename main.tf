terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider aws {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myEC2Instance" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformInstance1"
  }
  associate_public_ip_address = "true"
  availability_zone = "us-east-1a"
  root_block_device {
    delete_on_termination = "true"
    volume_size = 8
    volume_type = "gp2"
  }
}

