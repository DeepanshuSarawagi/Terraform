output "ec2-instance-public-ips" {
  value       = [for instance in module.ec2_instance : instance.public_ip]
  description = "Public IPs for EC2 instances"
}

output "ec2-instance-public-dns" {
  value       = [for instance in module.ec2_instance : instance.public_dns]
  description = "Public IPs for EC2 instances"
}