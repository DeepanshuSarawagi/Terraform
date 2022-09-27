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