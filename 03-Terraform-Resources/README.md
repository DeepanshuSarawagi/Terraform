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
  - depends_on
    - To handle hidden resources or module dependencies that Terraform can't automatically infer.
    - Explicitly specifying a dependency is only necessary when a resource or module is dependent on some other resource
      behaviour but doesn't access any of that resource's data in its argument.
    - This argument is present in module blocks and all resource block, regardless of its type.
    - The depends_on meta-argument if present, must be a list of references of other resources or child modules in the same
      calling module.
    - Arbitrary expressions are not allowed.
    - This must only be used as a last resort.

  - for_each
    - To create multiple instances according to a map or set of strings.

  - count
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

  - provider
    - For selecting a non-default provider configuration.

  - lifecycle
    - Standard resource behaviour can be altered using special nested lifecycle block within a resource body block.

  - provisioners and connections
    - For taking extra actions after resource creation like installing app on server or take action on local machine.