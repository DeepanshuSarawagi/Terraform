locals {
  bucket_name = "${var.app_name}-${var.env_name}-bucket"
}
resource "aws_s3_bucket" "mybucket1" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_acl" "mybucket1-acl" {
  bucket = aws_s3_bucket.mybucket1.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "mybucket1-versioning" {
  bucket = aws_s3_bucket.mybucket1.id
  versioning_configuration {
    status = "Enabled"
    mfa_delete = "Disabled"
  }
}