variable "instance_type" {
  default = {
    "dev" = "t2.micro"
    "qa"  = "t2.large"
    "prd" = "t3.large"
  }
  description = "EC2 instance type"
  type        = map(string)
}

variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region where resources needs to be provisioned"
  type        = string
}

variable "az" { // We be overriding this variable with -var switch in cli
  default     = "us-east-1a"
  description = "Availability zone where resource needs to be provisioned"
  type        = string
}

variable "resource_count" {
  default     = 1 // We be overriding this variable with -var switch in cli
  description = "No. of instances to be provisioned"
  type        = number
}

variable "ami_id" {
  default     = "ami-026b57f3c383c2eec"
  type        = string
  description = "AMI ID of the EC2 instance"
}

variable "key_name" {
  default     = "terraform-key"
  type        = string
  description = "Key pair which is required to SSH into instances"
}

variable "ec2_instance_tags" {
  type = map(string)
  default = {
    Tier = "Web"
    Name = "ec2WebServer"
  }
}