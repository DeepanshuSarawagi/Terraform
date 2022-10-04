# Terraform variables

There are three types of Terraform variables.
- Input variables.
- Output values.
- Local values.

## 1. Input variables

Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering
the modules own source code, and allowing modules to be shared between different configs.

- For input variables with default value types, check [here](04a-Terraform-Input-variables-basics/variables.tf).
- For input variables without default values, check [here](04a-Terraform-Input-variables-basics/variables.tf).
- For input variables override default values with -var switch, check [here](04a-Terraform-Input-variables-basics/variables.tf).
  - Command would look like this - ```$terraform apply --auto-approve -var="resource_count=2" -var="az=us-east-1b"```.
  - We can also output the terraform plan to a file and then apply config using it. Refer to below example commands.
    - ```$terraform plan -var="resource_count=2" -var="az=us-east-1b" -out plan.out```.
    - ```$terraform apply plan.out```.
  - For overriding default values of input variables with Environment variables, refer [this example](04a-Terraform-Input-variables-basics/variables.tf).
    - ```shell
      $export TF_VAR_name=<variable value>
      # for example
      $export TF_VAR_az=us-east-1c
      $export TF_VAR_resource_count=2
      $terraform plan
      $terraform apply --auto-approve
      ```
    - Once terraform apply is complete, you can unset the environment variables using ```unset``` command.
- 