# Terraform Fundamentals

## 1. Terraform Providers
- Heart of Terraform
- Every Resource type is implemented by a Provider
- Without providers, terraform cannot manage any infrastructure.
- Providers are distributed separately from Terraform and each provider has its own release and version.

### 1a. Provider Requirements
- provider name
- source
- version
```terraform
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

```
- The naming convention of source is HOSTNAME/NAMESPACE/TYPE

### 1b. Provider block
- Respective provider configuration.

```terraform
provider "aws" {
  profile = "default"
  region = "us-east-1"
}
```

### 1c. Dependency lock file
- The lock file will have provider version related information which will be locked in this file.
- Terraform configurations always refer to local name of provider outside of required_providers block.

## 2. Multiple Provider configuration
- We can define multiple configuration for the same provider and select which one to use on per-resource or per-module basis.
- The primary reason is to provide multiple region for a cloud provider to provision resources.

```terraform
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

provider "aws" {
  profile = "default"
  region = "us-west-1"
  alias = "aws-west-1"
}

// resource configuration block

resource "aws_vpc" "vpc-west-1" {
  cidr_block = "10.100.0.0/16"
  provider = "aws.aws-west-1"  // We used meta argument to create VPC resource in us-west-1 region
  tags = {
    Name = "VPC in US-WEST-1 region"
  }
}
```


