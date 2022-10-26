variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type"
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region where resources needs to be provisioned"
  type        = string
}

variable "az" {
  default     = "us-east-1a"
  description = "Availability zone where resource needs to be provisioned"
  type        = string
}

variable "resource_count" {
  default     = 1
  description = "No. of instances to be provisioned"
  type        = number
}

variable "key_name" {
  default     = "terraform-key-mac"
  type        = string
  description = "Key pair which is required to SSH into instances"
}