resource "aws_eip" "bastion_eip" {
  instance = module.bastion_ec2_instance.id
  domain   = "vpc"
  tags = local.common_tags
  depends_on = [module.bastion_ec2_instance, module.vpc]  // This is done since EIP needs to associated to IGW.
}