data "aws_ec2_instance_type_offerings" "myEc2Instance2" {
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
  for_each = toset(["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"])
  location_type = "availability-zone"
}

output "instance_type_2" {
  value = [for t in data.aws_ec2_instance_type_offerings.myEc2Instance2: t.instance_types]
}

output "instance_type_3" {
  value = {
    for az, inst in data.aws_ec2_instance_type_offerings.myEc2Instance2: az => inst.instance_types
  }
}