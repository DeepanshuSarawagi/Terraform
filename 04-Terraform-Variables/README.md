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
- For assigning input variables using [terraform.tfvars](04a-Terraform-Input-variables-basics/terraform.tfvars), check [this](04a-Terraform-Input-variables-basics/terraform.tfvars).
  - If [terraform.tfvars](04a-Terraform-Input-variables-basics/terraform.tfvars) is created, Terraform will override the default values defined in [variables.tf](04a-Terraform-Input-variables-basics/variables.tf).

## 3. Input variables with -var-file argument
- If we plan to use different ```.tfvars``` file name, then we need to explicitly assign it using ```-var-file``` argument
  while doing terraform plan or apply.
- ```terrform plan -var-file="dev.tfvars"```
- ```terrform apply -var-file="dev.tfvars"```

## 4. Input variables with .auto.tfvars file
- If we create a variables file name with .auto-tfvars extension, variables will be automatically picked up from this file
  during terraform plan and apply.
- For example, refer this [file](04c-Terraform-Input-variables-auto-tfvars/dev.auto.tfvars).
