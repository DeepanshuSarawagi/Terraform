resource "aws_instance" "ec2-east" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.az
  key_name               = var.key_name
  count                  = var.resource_count
  user_data              = file("${path.module}/apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc_ssh_web.id]
  tags = {
    Name = "My-EC2-Webserver"
  }
}