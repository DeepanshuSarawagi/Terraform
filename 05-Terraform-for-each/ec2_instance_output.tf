output "instance_public_ip" {
  value = toset([for instance in aws_instance.ec2Demo: instance.public_ip])
  description = "Display the public IP of every instance"
}

output "instance_public_dns" {
  value = toset([for instance in aws_instance.ec2Demo: instance.public_dns])
}