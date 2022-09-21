data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "myEc2Instance" {
  filter {
    name   = "location"
    values = [each.key]
  }

  // If you do not apply below filter, output will print all the supported instance_type offerings in each of the below 6
  // availability zones. So, be vary of it and apply filters if you dont want to burden yourself with lengthy output. :)

  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  for_each = toset(data.aws_availability_zones.my_azs.names)   // Instead of hard-coding AZs, we are datasource and its
                                                              // to get it for us
  location_type = "availability-zone"
}

// We are displaying the filtered instance_type (t3.micro) offerings in each AZ
output "instance_in_each_AZ" {
  value = {
    for az, inst in data.aws_ec2_instance_type_offerings.myEc2Instance: az => inst.instance_types
  }
}

// We are displaying the filtered instance_type (t3.micro) offerings in AZ only if it is available
output "supported_instance_in_each_AZ" {
  value = {
  for az, inst in data.aws_ec2_instance_type_offerings.myEc2Instance:
  az => inst.instance_types if length(inst.instance_types) != 0
  }
}

// We will Terraform keys function to print only those AZs where t3.micro is supported

output "supported_azs_keys" {
  value = keys({
    for az, inst in data.aws_ec2_instance_type_offerings.myEc2Instance:
      az => inst.instance_types if length(inst.instance_types) != 0
  })
}

/*
This file will manage the ami datasource resource which will get the latest AMI Id for Amazon linux 2.
We will dynamically find the amazon Linux2 AMI name using the filter options below and use the id attribute to get the
AMI ID. This AMI ID will be referenced in the aws_instance resource.
*/

data "aws_ami" "amzlinux2" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}