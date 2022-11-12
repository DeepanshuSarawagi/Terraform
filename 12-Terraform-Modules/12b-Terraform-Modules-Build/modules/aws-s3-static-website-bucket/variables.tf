variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket which must be unique across AWS"
}

variable "bucket_tags" {
  description = "Tags to set on the S3 bucket"
  type        = map(string)
  default     = {}
}

variable bucket_static_website_source {
  description = "The source content for hosting the static website on S3 bucket"
  type = string
}