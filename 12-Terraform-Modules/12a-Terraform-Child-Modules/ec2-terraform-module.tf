module "ec2_instance" {
  source   = "terraform-aws-modules/ec2-instance/aws"
  version  = "~> 3.0"
  for_each = toset(["one", "two", "three"])
  name     = "instance-${each.key}"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  key_name               = "terraform-key-win"
  monitoring             = true
  vpc_security_group_ids = ["sg-031bca5287cdcbde7"]
  subnet_id              = "subnet-0c56e06f7a2325f0f"
  user_data              = file("${path.module}/apache-install.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}