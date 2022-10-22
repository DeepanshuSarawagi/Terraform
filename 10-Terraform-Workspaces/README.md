# Terraform Workspaces

Terraform starts with a single workspace name "default". This "default" workspace can never be deleted.

By default, we are working in default workspace. Named workspaces allow conveniently switching between multiple instances of 
single configuration within its single backend.

A common use for multiple named workspaces is to create a parallel, distinct copy of a set of infrastructure in order to test
a set of changes before modifying the main production infrastructure.

Terraform CLI workspaces are completely different from Terraform Cloud workspaces. Every terraform workspace will have its
own ```terraform.tfstate``` file.

- Every initialized directory will have at least one workspace.
- For a given working directory, only one workspace can be selected.

Terraform workspace commands:

```shell
$terraform workspace show
$terraform workspace list
$terraform workspace new
$terraform workspace select
$terraform workspace delete
```

