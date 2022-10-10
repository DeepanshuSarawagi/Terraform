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

## 5. Input variables - Constructors with type List
- Input variables with type as list of strings. For example, refer [variables.tf](04d-Terraform-Input-variables-type-list/variables.tf).

## 6. Input variables - Constructors with type Map
- Variables defined are map of strings. For example, refer [variables.tf](04e-Terraform-Input-variables-type-map/variables.tf)

## 7. Terraform console
- ```terraform console``` command provides an interactive console for evaluating expressions.
  - ```
    $terraform console
    > 1 + 5
    6
    > length("deep")  // Returns length of string
    4
    > length(["a", "b", "c"])  // Returns of length of list
    3
    > length({"key" = "value", "key2" = "value2"})  // Returns length of map
    2
    
    // Below function will return the substring of a string. 
    substr("string", offset, length)
    
    
    > substr("some string", 0, 3)
    "som"
    > substr("some string", 0, 6)
    "some s"
    > substr("some string", 0, 8)
    "some str"
    > substr("some string", 1, 10)
    "ome string"
    ```
    
## 8. Input variables - Custom validation rule

- We can add custom validation rules while defining variables.
  - For implementation, please check [variables.tf](04f-Terraform-Input-variables-custom-validation/variables.tf)
    - ```
      D:\Learning\Terraform\04-Terraform-Variables\04f-Terraform-Input-variables-custom-validation> terraform plan    
      ╷
      │ Error: Invalid value for variable
      │
      │   on variables.tf line 25:
      │   25: variable "ami_id" {
      │     ├────────────────
      │     │ var.ami_id is "am"
      │
      │ The length of AMI id invalid or it should start with "ami-".
      │
      │ This was checked by the validation rule at variables.tf:30,3-13.
      ```
  - We get below error when we assigned incorrect value to the variable ```ami_id``` in [dev.auto.tfvars](04f-Terraform-Input-variables-custom-validation/dev.auto.tfvars).

## 9. Input variables - Protect sensitive variables

- In this section, we will implement how to let terraform know that we have sensitive variables defined.
- We created two variables, ```db_username``` and ```db_password``` in [variables.tf](04g-Terraform-Input-variables-sesitive-variables/variables.tf) file.
  - We used the argument ```sensitive=true``` in the variable definition.
- We then created one more file called [secrets.tfvars](04g-Terraform-Input-variables-sesitive-variables/secrets.tfvars) file to store the sensitive variable values.
- We will use this file in the terraform command using ```-var-file="secrets.tfvars"``` switch.
  - ```terraform apply -var-file="secrets.tfvars" --auto-approve```

## 10. Variable definition precedence

Terraform loads variables in the following order, with later sources taking precedence over earlier ones.
- Environment variables
- terraform.tfvars
- terraform.tfvars.json
- *.auto.tfvars or *.auto.tfvars.json
- Any -var or -var-file option on the command line in the order they are provided.