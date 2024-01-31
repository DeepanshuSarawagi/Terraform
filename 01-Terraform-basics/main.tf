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
  profile = "default"
}

resource "aws_instance" "myEC2Instance" {  // The syntax is Resource-Type "Resource-Name" "Block Label"
  ami = "ami-0a3c3a20c09d6f377"  // The syntax is Arguments/Identifiers = Argument-Values/Expression
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformInstance1"
  }
  associate_public_ip_address = "true"
  availability_zone = "us-east-1a"
  /*
  Block inside block is called as provisioners. For our understanding, we can see tag is a block inside resource block.
  root_block_device is a block inside resource block. Hence, these are termed as Provisioners.
  */
  root_block_device {
    delete_on_termination = "true"
    volume_size = 8
    volume_type = "gp2"
    encrypted = "true"
  }
}

