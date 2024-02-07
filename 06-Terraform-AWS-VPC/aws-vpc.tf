module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs = var.availability_zone
  private_subnets = var.vpc_private_subnets
  public_subnets = var.vpc_public_subnets

  // Database specific configuration
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group

  // nat gateway for outbound network
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  // VPC DNS parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Name = "Public-subnet-using-Terraform"
  }

  private_subnet_tags = {
    Name = "Private-subnet-using-Terraform"
  }

  database_subnet_tags = {
    Name = "Database-subnet-using-Terraform"
  }

  tags = merge({
    Owner = "Deepanshu"
    Env = "Dev"
  }, local.common_tags)

  vpc_tags = merge(
    {
      Name = "vpc-dev"
    }, local.common_tags
  )

  map_public_ip_on_launch = true
}