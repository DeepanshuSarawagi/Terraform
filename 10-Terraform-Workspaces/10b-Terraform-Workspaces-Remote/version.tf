terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "deepanshu-tf-remote-state-storage"
    key            = "workspace/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "deepanshu-tf-dev-state-table" // This is to enable the state locking
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}
