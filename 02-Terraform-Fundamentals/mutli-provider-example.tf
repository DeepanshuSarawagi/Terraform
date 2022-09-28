terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-west-1"
  alias = "aws-west-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  provider = "aws.aws-west-1"
  tags = {
    Name = "my-vpc-1 in west region"
  }
}
