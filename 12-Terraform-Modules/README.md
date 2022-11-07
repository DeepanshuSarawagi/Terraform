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
