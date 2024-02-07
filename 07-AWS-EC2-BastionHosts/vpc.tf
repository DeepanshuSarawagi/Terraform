data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"
  name = local.eks_cluster_name
  cidr = var.vpc_cidr_block

  azs = data.aws_availability_zones.available.names


}