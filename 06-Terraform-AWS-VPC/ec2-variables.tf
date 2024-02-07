variable "region" {  // test commit
  type = string
  description = "Specify the region in which AWS resources needs to be created"
  default = "us-east-1"
}

variable "availability_zone" {
  type = string
  description = "AZ in which AWS resource needs to be created"
  default = "us-east-1a"
}
variable "instance_type" {
  type = string
  description = "Specify EC2 instance type"
  default = "t3.micro"
}

variable "instance_key_pair" {
  description = "EC2 keypair that needs to be associated with EC2 instance for SSH"
  type = string
  default = "terraform-key"
}

variable "associate_public_ip_address" {
  type = bool
  description = "Specify if a Public IP needs to be associated with EC2 instance"
  default = true
}

variable "instance_type_list" {
  type = list(string)
  description = "EC2 instance type list"
  default = ["t2.micro", "t1.micro"]
}

variable "instance_type_map" {
  type = map(string)
  description = "EC2 instance type list"
  default = {
    "dev"= "t1.micro"
    "qa"= "t2.micro"
    "prod"= "t2.small"
  }
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}
# Business Division
variable "business_division" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "SAP"
}