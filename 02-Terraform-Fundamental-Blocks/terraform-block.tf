terraform {
  required_version = "~> 1.2.9"  # This will allow to use terraform version > 1.2.9 but < 1.3
  required_providers {
    aws = {                      // Here aws is an argument within required_providers block. Also specifically, it is a
                                 // map argument
      version = "~> 4.0"         # This will use aws provider version 4 but not version 5 if released
      source = "Hashicorp/aws"
    }
  }
}