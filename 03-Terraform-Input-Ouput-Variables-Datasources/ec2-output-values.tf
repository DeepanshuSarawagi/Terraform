/*
A root module can outputs to print certain values in the CLI after running the terraform apply command.
A child module can use outputs to expose a subset of its resource attribute to a parent module.
When using remote state, root modules output can be accessed by other configurations via a terraform_remote_state data
source.
In this demo we will output the public IP and public dns name
*/

output "instance_public_ip" {
  value = aws_instance.TerraformEC2Demo1.public_ip
  description = "EC2 instance public IP"
}

output "instance_public_dns" {
  value = aws_instance.TerraformEC2Demo1.public_dns
  description = "EC2 instance public dns"
}

