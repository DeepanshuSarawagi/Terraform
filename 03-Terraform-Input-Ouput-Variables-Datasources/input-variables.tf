/*
This file is for managing input variables which will be used to provision EC2 instance.
*/

variable "aws_region" {
  type = string
  description = "Specify the region in which AWS resources needs to be created"
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  description = "Specify EC2 instance type"
  default = "t2.micro"
}

variable "instance_key_pair" {
  description = "EC2 keypair that needs to be associated with EC2 instance for SSH"
  type = string
  default = "terraform-key"
}

variable "availability_zone" {
  type = string
  description = "AZ in which AWS resource needs to be created"
  default = "us-east-1a"
}

variable "associate_public_ip_address" {
  type = bool
  description = "Specify if a Public IP needs to be associated with EC2 instance"
  default = true
}