variable "region" {
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
  default = "us-east-1-key"
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