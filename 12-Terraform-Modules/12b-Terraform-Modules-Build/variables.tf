variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
  description = "Name of the S3 bucket which must be unique across AWS"
}

variable "bucket_tags" {
  description = "Tags to set on the S3 bucket"
  type = map(string)
  default = {}
}