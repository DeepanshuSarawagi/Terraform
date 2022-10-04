# Terraform variables

There are three types of Terraform variables.
- Input variables.
- Output values.
- Local values.

## 1. Input variables

Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering
the modules own source code, and allowing modules to be shared between different configs.

- For input variables with default value types, check [here](04a-Terraform-Input-variables-basics/variables.tf)
- 