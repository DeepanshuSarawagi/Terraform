output "instance_public_ip" {
  value = toset([for instance in aws_instance.ec2Demo: instance.public_ip])
  description = "Display the public IP of every instance"
}

output "instance_public_dns" {
  value = toset([for instance in aws_instance.ec2Demo: instance.public_dns])
  description = "Display the public dns of all the EC2 instances"
}

output "instance_public_dns_map" {
  value = tomap({for az, instance in aws_instance.ec2Demo: az => instance.public_dns})
  description = "Display the public dns of all the Ec2 instances using map"
}