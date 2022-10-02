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
  - for_each
    - To create multiple instances according to a map or set of strings.
  - count
    - For creating multiple resources according to a count.
  - provider
    - For selecting a non-default provider configuration.
  - lifecycle
    - Standard resource behaviour can be altered using special nested lifecycle block within a resource body block.
  - provisioners and connections
    - For taking extra actions after resource creation like installing app on server or take action on local machine.