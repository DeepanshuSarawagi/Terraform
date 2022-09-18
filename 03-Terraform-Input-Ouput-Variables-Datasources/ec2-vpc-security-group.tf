resource "aws_security_group" "vpc-ssh" {
  name = "default-vpc-ssh"
  description = "Allow SSH access from my local desktop"

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    description = "SSH from default VPC"
    cidr_blocks = ["192.168.1.104/32"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    description = "Allow outbound connections to everywhere"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default-vpc-ssh"
  }
}

# Security group for web traffic
resource "aws_security_group" "vpc-web" {
  name = "default-vpc-web"
  description = "Allow web access"

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    description = "Web access from default VPC"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    protocol  = "tcp"
    to_port   = 443
    description = "Secure Web access from default VPC"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    description = "Allow outbound connections to everywhere"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default-vpc-web"
  }
}