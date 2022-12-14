# Terraform Resources

## 1. Resource syntax 
- Following is the basic syntax of a resource block

```terraform
resource "aws_instance" "myEc2inst" {
  ami = "string"
  instance_type = "t2.micro"
  associate_public_ip_address = false
  availability_zone = "us-east-1a"
}

/*

<BLOCK TYPE> <BLOCK Label> <BLOCK Local Label> {
  <IDENTIFIER> = <EXPRESSION>  # Arguments
  <IDENTIFIER2> = <EXPRESSION>  # Arguments
  <IDENTIFIER3> = <EXPRESSION>  # Arguments
 }

*/

resource "aws_vpc" "vpc-east-1" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc-1"
  }
  enable_dns_support = true
  enable_dns_hostnames = true
}
```

## 2. Resource behavior

- Create resources that exist in the configuration but are not associated with a real infrastructure object in state.
- Destroy resources that exist in the state but no longer exist in the configuration.
- Update in-place resources whose configurations have changed.
- Destroy and re-create resources whose arguments have changes but which cannot be updated in-place due to remote API limitations.

## 3. Resource Meta Arguments
- Meta arguments can be used with any resource type to change its behavior.
- Following are the meta arguments

### 3a. depends_on:
  - To handle hidden resources or module dependencies that Terraform can't automatically infer.
  - Explicitly specifying a dependency is only necessary when a resource or module is dependent on some other resource
    behaviour but doesn't access any of that resource's data in its argument.
  - This argument is present in module blocks and all resource block, regardless of its type.
  - The depends_on meta-argument if present, must be a list of references of other resources or child modules in the same
    calling module.
  - Arbitrary expressions are not allowed.
  - This must only be used as a last resort.
  - For implementation, refer to this [code example](03a-Terraform-depends-on-meta-arg/vpc-create.tf).

### 3b. for_each:
  - To create multiple instances according to a map or set of strings.
  - If a resource or module block includes a for_each meta-argument whose value is a map or set of strings, Terraform will
    create one instance for each member of that map or set.
  - Each instance has a distinct infrastructure object associated with it, and each is separately created, updated or
    destroyed when the configuration is applied.
  - In blocks where ```for_each``` is set, an additional ```each``` object is available in expressions, so you can modify
    the configuration of each instance. 
    - ```each.key``` - The map key or set member corresponding to this instance.
    - ```each.value``` - The map value corresponding to this instance. If a set is used in ```for_each```
      then ```each.key = each.value```.
  - Implementation of ```for_each``` [using maps](03c-Terraform-for-each-meta-arg/s3-bucket.tf).

### 3c. count:
  - For creating multiple resources according to a count.
  - If a resource or module has a count meta-argument which value is a whole number, Terraform will create that many 
    instances.
  - Each instance has a distinct infrastructure object associated with it, and each is separately created, updated or
    destroyed when the configuration is applied.
  - The count meta-argument accepts numeric expressions. The count value must be known before Terraform performs any remote
    resource actions.
  - ```count.index``` The distinct index number starting with 0 corresponds to the instance.
  - When count is set, Terraform distinguishes between block and the multiple resources or module instance associated with it.
  - Instances are identified by an index number starting with 0.
  - ```terraform
    resource "aws_instance" "web" {
      instance_type = "t2.micro"
      ami = "ami-abcdefghijk"
      count = 5
      tags = {
      Name = "web-${count.index}"
        }
    }
    ```
  - For implementation, refer to this [code example](03b-Terraform-count-meta-arg/ec2Create.tf).

### 3d. provider:
  - For selecting a non-default provider configuration.

### 3e. lifecycle:
  - Standard resource behaviour can be altered using special nested lifecycle block within a resource body block.
  - It is a nested block that can appear within a resource block.
  - It is available for all resource blocks irrespective of its type.
  - Three ways we can change the behavior of a resource:
    - ```create_before_destroy```: Default behaviour of resource is destroy and then create. With this meta-argument, it
      is first created and then destroyed. For implementation example, refer [here](03d-Terraform-lifecyle-meta-arg/lifecycle-create_before_destroy-demo.tf).
    - ```prevent_destroy```: This will prevent Terraform from destroying any resources. For example, refer [here](03d-Terraform-lifecyle-meta-arg/lifecycle-prevent_destroy-demo.tf)
    - ```ignore_changes```: By default, Terraform will remove any manual changes made to the resource since it doesn't match 
      with resource state file. Using this lifecycle meta-argument, Terraform will accept any manual changes made to the environment.
      For implementation example, refer [here](03d-Terraform-lifecyle-meta-arg/lifecycle-ignore_changes-demo.tf)

### 3f. provisioners and connections:
  - For taking extra actions after resource creation like installing app on server or take action on local machine.