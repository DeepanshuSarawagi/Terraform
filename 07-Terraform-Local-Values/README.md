# Terraform Local values

## Output values example

In this section, we are going to learn about terraform Local values of a resource.

- A local value assigns a name to an expression, so you can use that value in the module without repeating it.
- Local values are function's temporary local variables.
- Once local value is declared, you can reference it in resource block like this ```local.<NAME>```.
  - ```terraform
    locals {
      env_name = "dev"
      tier_name = "Web" 
    }
    resource aws_instance "ec2" {
    
    tags = {
    Env = local.env_name
    Tier = local.tier_name
    }
    }  
    ```
- For implementation, refer [s3-bucket.tf](s3-bucket.tf).