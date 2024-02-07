variable "region" {
  type = string
  default = "us-east-1"
  description = "AWS region"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}