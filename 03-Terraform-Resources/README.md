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
- 