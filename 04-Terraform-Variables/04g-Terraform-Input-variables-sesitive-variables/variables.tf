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

variable "ami_id" {
  default     = "ami-026b57f3c383c2eec"
  type        = string
  description = "AMI ID of the EC2 instance"
  validation {
    condition     = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "The length of AMI id invalid or it should start with \"ami-\"."
  }
}

variable "key_name" {
  default     = "terraform-key"
  type        = string
  description = "Key pair which is required to SSH into instances"
}

// This is how we make the variables sensitive.

variable "db_username" {
  description = "AWS RDS instance DB username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "AWS RDS instance DB password"
  type        = string
  sensitive   = true
}