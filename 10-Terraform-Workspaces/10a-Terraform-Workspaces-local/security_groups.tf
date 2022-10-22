resource "aws_security_group" "vpc_ssh_web" {
  description = "Allow SSH access to the instance"
  name        = "vpc-ssh-web-${terraform.workspace}"
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    description = "SSH access from internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    description = "HTTP access from internet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound connections"
  }
  tags = {
    Name = "vpc-ssh-web-${terraform.workspace}"
  }
}