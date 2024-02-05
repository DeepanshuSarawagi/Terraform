module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"
  name = "my-vpc-terraform"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  // Database specific configuration
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
  create_database_subnet_group = true

  // nat gateway for outbound network
  enable_nat_gateway = true
  single_nat_gateway = true

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

  tags = {
    Owner = "Deepanshu"
    Env = "Dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }

}