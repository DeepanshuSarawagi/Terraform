terraform {
  required_version = "~> 1.2"
  required_providers {
    aws = {
      version = "~> 4.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = var.region
}