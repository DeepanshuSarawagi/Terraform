output "ec2_public_ip" {
  value       = aws_instance.ec2-east.*.public_ip
  description = "EC2 instance public IP"
}

output "ec2_private_ip" {
  value       = aws_instance.ec2-east.*.private_ip
  description = "EC2 instance private IP"
}

output "ec2_public_dns" {
  value       = "http://${aws_instance.ec2-east.*.public_dns}"
  description = "EC2 instance public dns"
}

output "ec2_security_groups" {
  value       = aws_security_group.vpc_ssh_web.*.id
  description = "List of security groups of EC2 instance"
}
