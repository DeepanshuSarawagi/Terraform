# Terraform Modules

Modules are containers for multiple resources that are used together. A module consists of ```.tf``` files kept together
in a directory. Modules are main way to package and reuse resource configurations with Terraform..

Every Terraform configuration has at least one module called as root module, which consists of the resources defined in the
.tf files in the main working directory. A Terraform root module can call other modules to include their resources in the
configuration.

A module that has been called by another module is called a child module.

A child module can be called multiple times within the same configuration, and multiple configurations can use the same
child module.

In addition to modules from local filesystem, Terraform can load modules from public or private registry.

## Terraform Registry - Publicly available modules

Terraform Registry hosts a broad collection of publicly available modules for configuring many kinds of common infrastructure.
These modules are free to use and Terraform can download them if we specify the source and version in the module block.

## Terraform Cloud and Enterprise - Private modules

We can publish our modules which is especially crafted for use within organization as per the needs. 
It can be used by employees within organization.

## Terraform - Taint resources within a module

```terraform taint``` command can be used to taint a specific resource within a module.
It is not possible to taint an entire module. Each resource within the module must be tainted separately.

Normally, you need not escape double quotes on a Unix system and also you need not pass the resource name in single quotes.
For taint command to work on a Windows system, the command should look like this.

```shell
$terraform taint 'module.ec2_instance[\"one\"].aws_instance.this[0]'

#Resource instance module.ec2_instance["one"].aws_instance.this[0] has been marked as tainted.
```



