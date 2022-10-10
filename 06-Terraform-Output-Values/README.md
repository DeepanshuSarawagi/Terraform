# Terraform output values

## Output values example

In this section, we are going to learn about terraform output values of a resource.

- A root module can use outputs to print certain values in the CLI output post executing terraform apply command.
- A child module can use output to expose subset of its resource attributes to a parent module.
- When using remote state, root module outputs can be accessed by other configurations via a 
  ```terraform_remote_state``` datasource.

For implementation/example, please refer [output.tf](output.tf).

## Query terraform output

```terraform output``` command print the output values using the terraform.tfstate file since all the resource specific info
is saved into this file.

We can use below commands to query the terraform output using the CLI.

```shell
- terraform output ec2_public_ip
- terraform output ec2_private_ip
- terraform output ec2_security_groups
- terraform output ec2_public_dns 
- terraform output -json   #prints all the outputs in JSON format
```
