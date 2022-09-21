data "aws_ec2_instance_type_offerings" "myEc2Instance1" {
  filter {
    name   = "location"
    values = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
  }

  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  location_type = "availability-zone"
}

output "instance_type_1" {
  value = data.aws_ec2_instance_type_offerings.myEc2Instance1.instance_types
}