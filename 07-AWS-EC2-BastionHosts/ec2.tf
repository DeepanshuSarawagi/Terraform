module "bastion_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  name = "${local.name}-bastion-host"

  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = false
  ami = data.aws_ami.amzlinux2.id
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = merge({
    Terraform   = "true"
  },local.common_tags)
}